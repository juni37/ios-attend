//
//  ClassCellViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine
import UIKit

class ClassCellViewModel : ObservableObject, Identifiable {
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
    }
}
