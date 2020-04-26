//
//  StudentListViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine

class StudentListViewModel: ObservableObject {
    @Published var studentCellViewModels = [StudentCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.studentCellViewModels = testDataStudents.map { student in
            StudentCellViewModel(student: student)
        }
    }
}

