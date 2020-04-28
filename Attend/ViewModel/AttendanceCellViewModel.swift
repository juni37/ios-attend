//
//  AttendanceCellViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine
import UIKit
import Resolver

class AttendanceCellViewModel : ObservableObject, Identifiable {
    
    @Injected var attendanceRepository: AttendanceRepository

    @Published var attendance: Attendance
    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    init(attendance: Attendance) {
        self.attendance = attendance
        
        $attendance.map { attendance in
            attendance.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
        
        $attendance
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { attendance in
                self.attendanceRepository.updateAttendance(attendance)
            }
            .store(in: &cancellables)
            
    }
}
