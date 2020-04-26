//
//  StudentCellVM.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine
import UIKit

class StudentCellViewModel : ObservableObject, Identifiable {
    @Published var student: Student
    var id: String = ""
    @Published var color : UIColor = UIColor.white
    
    private var cancellables = Set<AnyCancellable>()
    init(student: Student) {
        self.student = student
        
        $student.map { student in
            student.color
        }
        .assign(to: \.color, on: self)
        .store(in: &cancellables)
        
        $student.map { student in
            student.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}
