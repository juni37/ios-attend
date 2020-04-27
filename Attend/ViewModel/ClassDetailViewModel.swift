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

class ClassDetailViewModel : ObservableObject, Identifiable {
    
    @Published var classCellVM: ClassCellViewModel
    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    init(classCellVM: ClassCellViewModel) {
        self.classCellVM = classCellVM
        
        $classCellVM.map { classCellVM in
            classCellVM.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}
