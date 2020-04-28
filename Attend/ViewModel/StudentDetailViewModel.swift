//
//  StudentDetailViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Resolver

class StudentDetailViewModel : ObservableObject, Identifiable {
    @Published var attendanceRepository: AttendanceRepository = Resolver.resolve()
    @Published var studentCellVM: StudentCellViewModel
    
    @Published var attendanceCellViewModels: [AttendanceCellViewModel] = [AttendanceCellViewModel]()

    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(studentCellVM: StudentCellViewModel) {
        self.studentCellVM = studentCellVM
        attendanceRepository.$attendances.map { attendances in
            attendances.map { attendance in
                AttendanceCellViewModel(attendance: attendance)
            }
        }
        .assign(to: \.attendanceCellViewModels, on: self)
        .store(in: &cancellables)
        
        self.attendanceCellViewModels = self.attendanceCellViewModels.filter { $0.attendance.student.id == studentCellVM.student.id}
        
        $studentCellVM.map { studentCellVM in
            studentCellVM.id
        }
        .assign(to: \.id, on: self)
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
