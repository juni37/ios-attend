//
//  ClassListViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine

class ClassListViewModel: ObservableObject {
    @Published var classCellViewModels = [ClassCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.classCellViewModels = testDataClasses.map { cclass in
            ClassCellViewModel(oclass: cclass)
        }
    }
}

