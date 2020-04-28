//
//  AttendanceRepository.swift
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

class BaseAttendanceRepository {
    @Published var attendances = [Attendance]()
}

protocol AttendanceRepository: BaseAttendanceRepository {
    func addAttendance(_ attendance: Attendance)
    func removeAttendance(_ attendance: Attendance)
    func updateAttendance(_ attendance: Attendance)
}

class TestDataAttendanceRepository: BaseAttendanceRepository, AttendanceRepository, ObservableObject {
    override init() {
        super.init()
        self.attendances = []
    }
    
    func addAttendance(_ attendance: Attendance) {
        attendances.append(attendance)
    }
    
    func removeAttendance(_ attendance: Attendance) {
        if let index = attendances.firstIndex(where: { $0.id == attendance.id }) {
            attendances.remove(at: index)
        }
    }
    
    func updateAttendance(_ attendance: Attendance) {
        if let index = self.attendances.firstIndex(where: { $0.id == attendance.id } ) {
            self.attendances[index] = attendance
        }
    }
}

class LocalAttendanceRepository: BaseAttendanceRepository, AttendanceRepository, ObservableObject {
    override init() {
        super.init()
        loadData()
    }
    
    func addAttendance(_ attendance: Attendance) {
        self.attendances.append(attendance)
        saveData()
    }
    
    func removeAttendance(_ attendance: Attendance) {
        if let index = attendances.firstIndex(where: { $0.id == attendance.id }) {
            attendances.remove(at: index)
            saveData()
        }
    }
    
    func updateAttendance(_ attendance: Attendance) {
        if let index = self.attendances.firstIndex(where: { $0.id == attendance.id } ) {
            self.attendances[index] = attendance
            saveData()
        }
    }
    
    private func loadData() {
        if let retrievedAttendances = try? Disk.retrieve("attendance.json", from: .documents, as: [Attendance].self) {
            self.attendances = retrievedAttendances
        }
    }
    
    private func saveData() {
        do {
            try Disk.save(self.attendances, to: .documents, as: "attendance.json")
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
