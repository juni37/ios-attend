//
//  AttendenceRepository.swift
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

class BaseAttendenceRepository {
    @Published var attendences = [Attendence]()
}

protocol AttendenceRepository: BaseAttendenceRepository {
    func addAttendence(_ attendence: Attendence)
    func removeAttendence(_ attendence: Attendence)
    func updateAttendence(_ attendence: Attendence)
}

class TestDataAttendenceRepository: BaseAttendenceRepository, AttendenceRepository, ObservableObject {
    override init() {
        super.init()
        self.attendences = []
    }
    
    func addAttendence(_ attendence: Attendence) {
        attendences.append(attendence)
    }
    
    func removeAttendence(_ attendence: Attendence) {
        if let index = attendences.firstIndex(where: { $0.id == attendence.id }) {
            attendences.remove(at: index)
        }
    }
    
    func updateAttendence(_ attendence: Attendence) {
        if let index = self.attendences.firstIndex(where: { $0.id == attendence.id } ) {
            self.attendences[index] = attendence
        }
    }
}

class LocalAttendenceRepository: BaseAttendenceRepository, AttendenceRepository, ObservableObject {
    override init() {
        super.init()
        loadData()
    }
    
    func addAttendence(_ attendence: Attendence) {
        self.attendences.append(attendence)
        saveData()
    }
    
    func removeAttendence(_ attendence: Attendence) {
        if let index = attendences.firstIndex(where: { $0.id == attendence.id }) {
            attendences.remove(at: index)
            saveData()
        }
    }
    
    func updateAttendence(_ attendence: Attendence) {
        if let index = self.attendences.firstIndex(where: { $0.id == attendence.id } ) {
            self.attendences[index] = attendence
            saveData()
        }
    }
    
    private func loadData() {
        if let retrievedAttendences = try? Disk.retrieve("attendence.json", from: .documents, as: [Attendence].self) {
            self.attendences = retrievedAttendences
        }
    }
    
    private func saveData() {
        do {
            try Disk.save(self.attendences, to: .documents, as: "attendence.json")
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
