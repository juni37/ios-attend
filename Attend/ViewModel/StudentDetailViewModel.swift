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
    @Published var color: UIColor = UIColor.white
    
    private var cancellables = Set<AnyCancellable>()
    init(studentCellVM: StudentCellViewModel) {
        self.studentCellVM = studentCellVM
        
        $studentCellVM.map { studentCellVM in
            studentCellVM.color
        }
        .assign(to: \.color, on: self)
        .store(in: &cancellables)
        
        $studentCellVM.map { studentCellVM in
            studentCellVM.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}
