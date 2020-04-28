//
//  ClassRepository.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Disk
import Firebase
import Combine
import Resolver

class BaseClassRepository {
  @Published var classes = [Class]()
}

protocol ClassRepository: BaseClassRepository {
  func addClass(_ oclass: Class)
  func removeClass(_ oclass: Class)
  func updateClass(_ oclass: Class)
}

class TestDataClassRepository: BaseClassRepository, ClassRepository, ObservableObject {
  override init() {
    super.init()
    self.classes = testDataClasses
  }
  
  func addClass(_ oclass: Class) {
    classes.append(oclass)
  }
  
  func removeClass(_ oclass: Class) {
    if let index = classes.firstIndex(where: { $0.id == oclass.id }) {
      classes.remove(at: index)
    }
  }
  
  func updateClass(_ oclass: Class) {
    if let index = self.classes.firstIndex(where: { $0.id == oclass.id } ) {
      self.classes[index] = oclass
    }
  }
}

class LocalClassRepository: BaseClassRepository, ClassRepository, ObservableObject {
  override init() {
    super.init()
    loadData()
  }
  
  func addClass(_ oclass: Class) {
    self.classes.append(oclass)
    saveData()
  }
  
  func removeClass(_ oclass: Class) {
    if let index = classes.firstIndex(where: { $0.id == oclass.id }) {
      classes.remove(at: index)
      saveData()
    }
  }
  
  func updateClass(_ oclass: Class) {
    if let index = self.classes.firstIndex(where: { $0.id == oclass.id } ) {
      self.classes[index] = oclass
      saveData()
    }
  }
  
  private func loadData() {
    if let retrievedClasses = try? Disk.retrieve("class.json", from: .documents, as: [Class].self) {
      self.classes = retrievedClasses
    }
  }
  
  private func saveData() {
    do {
      try Disk.save(self.classes, to: .documents, as: "class.json")
    }
    catch let error as NSError {
      fatalError("""
        Domain: \(error.domain)
        Code: \(error.code)
        Description: \(error.localizedDescription)
        Failure Reason: \(error.localizedFailureReason ?? "")
        Suggestions: \(error.localizedRecoverySuggestion ?? "")
        """)
    }
  }
}
