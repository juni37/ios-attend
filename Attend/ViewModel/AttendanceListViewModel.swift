//
//  AttendanceListViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine
import Resolver

class AttendanceListViewModel: ObservableObject {
    
    @Published var attendanceCellViewModels = [AttendanceCellViewModel]()
    @Published var attendanceRepository: AttendanceRepository = Resolver.resolve()
    @Published var classRepository: ClassRepository = Resolver.resolve()


    private var cancellables = Set<AnyCancellable>()
    
    init() {
        attendanceRepository.$attendances.map { attendances in
            attendances.map { attendance in
                AttendanceCellViewModel(attendance: attendance)
            }
        }.assign(to: \.attendanceCellViewModels, on: self)
        .store(in: &cancellables)

    }
        
    func removeAttendance(atOffsets indexSet: IndexSet) {
      // remove from repo
      let viewModels = indexSet.lazy.map { self.attendanceCellViewModels[$0] }
      viewModels.forEach { attendanceCellViewModel in
        attendanceRepository.removeAttendance(attendanceCellViewModel.attendance)
      }
    }
    
    func addStudent(attendance: Attendance) {
        attendanceRepository.addAttendance(attendance)
    }

}
