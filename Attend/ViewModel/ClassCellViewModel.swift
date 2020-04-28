//
//  ClassCellViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine
import Resolver


class ClassCellViewModel : ObservableObject, Identifiable {

    @Injected var classRepository: ClassRepository

    @Published var currentClass: Class
    var id: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    init(oclass: Class) {
        self.currentClass = oclass
        
        $currentClass.map { cclass in
            cclass.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)

        $currentClass
        .dropFirst()
        .debounce(for: 0.8, scheduler: RunLoop.main)
        .sink { cclass in
            self.classRepository.updateClass(cclass)
        }
        .store(in: &cancellables)
            
    }
}
