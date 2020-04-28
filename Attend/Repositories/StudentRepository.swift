//
//  StudentRepository.swift
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

class BaseStudentRepository {
    @Published var students = [Student]()
}

protocol StudentRepository: BaseStudentRepository {
    func addStudent(_ student: Student)
    func removeStudent(_ student: Student)
    func updateStudent(_ student: Student)
}

class TestDataStudentRepository: BaseStudentRepository, StudentRepository, ObservableObject {
    override init() {
        super.init()
        self.students = testDataStudents
    }
    
    func addStudent(_ student: Student) {
        students.append(student)
    }
    
    func removeStudent(_ student: Student) {
        if let index = students.firstIndex(where: { $0.id == student.id }) {
            students.remove(at: index)
        }
    }
    
    func updateStudent(_ student: Student) {
        if let index = self.students.firstIndex(where: { $0.id == student.id } ) {
            self.students[index] = student
        }
    }
}

class LocalStudentRepository: BaseStudentRepository, StudentRepository, ObservableObject {
    override init() {
        super.init()
        loadData()
    }
    
    func addStudent(_ student: Student) {
        self.students.append(student)
        saveData()
    }
    
    func removeStudent(_ student: Student) {
        if let index = students.firstIndex(where: { $0.id == student.id }) {
            students.remove(at: index)
            saveData()
        }
    }
    
    func updateStudent(_ student: Student) {
        if let index = self.students.firstIndex(where: { $0.id == student.id } ) {
            self.students[index] = student
            saveData()
        }
    }
    
    private func loadData() {
        if let retrievedStudents = try? Disk.retrieve("class.json", from: .documents, as: [Student].self) {
            self.students = retrievedStudents
        }
    }
    
    private func saveData() {
        do {
            try Disk.save(self.students, to: .documents, as: "class.json")
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
