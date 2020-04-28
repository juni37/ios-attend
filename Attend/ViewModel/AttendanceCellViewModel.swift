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

    var dateFormatter:DateFormatter

    @Published var attendance: Attendance
    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    init(attendance: Attendance) {
        self.attendance = attendance
        dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        
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
    func returnDate() -> String {
        return dateFormatter.string(from: attendance.date)
        //(with: Locale(identifier: "ko_KR")
    }
}
