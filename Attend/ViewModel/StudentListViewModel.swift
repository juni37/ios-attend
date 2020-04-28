//
//  StudentListViewModel.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Combine
import Resolver

class StudentListViewModel: ObservableObject {
    
    @Published var studentCellViewModels = [StudentCellViewModel]()
    @Published var studentRepository: StudentRepository = Resolver.resolve()
    @Published var classRepository: ClassRepository = Resolver.resolve()


    private var cancellables = Set<AnyCancellable>()
    
    init() {
        studentRepository.$students.map { students in
            students.map { student in
                StudentCellViewModel(student: student)
            }
        }.assign(to: \.studentCellViewModels, on: self)
        .store(in: &cancellables)

    }
        
    func removeStudents(atOffsets indexSet: IndexSet) {
      // remove from repo
      let viewModels = indexSet.lazy.map { self.studentCellViewModels[$0] }
      viewModels.forEach { studentCellViewModel in
        studentRepository.removeStudent(studentCellViewModel.student)
      }
    }
    
    func addStudent(student: Student) {
        studentRepository.addStudent(student)
    }

}

