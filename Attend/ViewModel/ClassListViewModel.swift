//
//  ClassListViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine
import Resolver

class ClassListViewModel: ObservableObject {
    @Published var classCellViewModels = [ClassCellViewModel]()
    @Published var classRepository: ClassRepository = Resolver.resolve()

    private var cancellables = Set<AnyCancellable>()
    
    init() {
        classRepository.$classes.map { classes in
            classes.map { oclass in
                ClassCellViewModel(oclass: oclass)
            }
        }
        .assign(to: \.classCellViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func removeClasses(atOffsets indexSet: IndexSet) {
      // remove from repo
      let viewModels = indexSet.lazy.map { self.classCellViewModels[$0] }
      viewModels.forEach { classCellViewModel in
        classRepository.removeClass(classCellViewModel.currentClass)
      }
    }
    
    func addClass(oclass: Class) {
      classRepository.addClass(oclass)
    }
}

