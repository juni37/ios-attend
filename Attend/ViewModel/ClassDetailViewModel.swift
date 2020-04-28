//
//  ClassDetailViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Resolver

class ClassDetailViewModel : ObservableObject, Identifiable {
    @Published var studentRepository: StudentRepository = Resolver.resolve()
    @Published var attendanceRepository: AttendanceRepository = Resolver.resolve()
    @Published var classCellVM: ClassCellViewModel
    @Published var studentCellViewModels: [StudentCellViewModel] = [StudentCellViewModel]()
    @Published var attendanceCellViewModels: [AttendanceCellViewModel] = [AttendanceCellViewModel]()
    
    var id: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    
    init(classCellVM: ClassCellViewModel) {
        self.classCellVM = classCellVM
        attendanceRepository.$attendances.map { attendances in
            attendances.map { attendance in
                AttendanceCellViewModel(attendance: attendance)
            }
        }
        .assign(to: \.attendanceCellViewModels, on: self)
        .store(in: &cancellables)
        
        studentRepository.$students.map { students in
            students.map { student in
                StudentCellViewModel(student: student)
            }
        }.assign(to: \.studentCellViewModels, on: self)
        .store(in: &cancellables)
        
    }
    
    func removeAttendance(atOffsets indexSet: IndexSet) {
        // remove from repo
        let viewModels = indexSet.lazy.map { self.attendanceCellViewModels[$0] }
        viewModels.forEach { attendanceCellViewModel in
            attendanceRepository.removeAttendance(attendanceCellViewModel.attendance)
        }
    }
    
    func addAttendance(attendance: Attendance) {
        attendanceRepository.addAttendance(attendance)
    }
}
