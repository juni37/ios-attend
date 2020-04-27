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

class StudentDetailViewModel : ObservableObject, Identifiable {
    
    @Published var studentCellVM: StudentCellViewModel
    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    init(studentCellVM: StudentCellViewModel) {
        self.studentCellVM = studentCellVM
        
        $studentCellVM.map { studentCellVM in
            studentCellVM.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}
