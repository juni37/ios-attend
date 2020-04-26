//
//  ClassDetailView.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import SwiftUI

struct ClassDetailView: View {
    @ObservedObject var classDetailViewModel: ClassDetailViewModel
    
    var classes = testDataClasses
    
    
    var body: some View {
        VStack {
            List {
                ForEach(testDataStudents) { student in
                    VStack {
                        StudentSummaryView(studentCellVM: StudentCellViewModel(student: student))
                        NavigationLink(destination: StudentDetailView(studentDetailViewModel: StudentDetailViewModel(studentCellVM: StudentCellViewModel(student: student)))) {
                            EmptyView().frame(width: 0, height: 0, alignment: .center)
                        }
                    }
                }
                
            }
        }
        .navigationBarTitle(classDetailViewModel.classCellVM.currentClass.name)
        
    }
}

struct ClassDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClassDetailView(classDetailViewModel: ClassDetailViewModel(classCellVM: ClassCellViewModel(oclass: testDataClasses[1])))
    }
}
