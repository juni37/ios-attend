//
//  StudentCellViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine
import UIKit
import Resolver

class StudentCellViewModel : ObservableObject, Identifiable {
    
    @Injected var studentRepository: StudentRepository
    @Injected var attendanceRepository: AttendanceRepository

    @Published var student: Student
    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    init(student: Student) {
        self.student = student
        
        $student.map { student in
            student.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
        
        $student
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { student in
                self.studentRepository.updateStudent(student)
            }
            .store(in: &cancellables)
            
    }
    
    func addAttendance(status: Status) {
        attendanceRepository.addAttendance(Attendance(student: student, attendedClass: student.classes[0], date: Date(), status: status))
    }
}
