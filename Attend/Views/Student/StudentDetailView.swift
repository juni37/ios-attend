//
//  StudentDetailView.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct StudentDetailView: View {
    @ObservedObject var studentDetailViewModel: StudentDetailViewModel

    var body: some View {
        VStack {
            List {
                ForEach(self.studentDetailViewModel.studentCellVM.student.classes) { oclass in
                    VStack {
                        ClassSummaryView(classCellVM: ClassCellViewModel(oclass: oclass))
                    }
                }
                
            }
        }
        .navigationBarTitle(studentDetailViewModel.studentCellVM.student.name)
        
    }
}
//
//struct StudentDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentDetailView(studentDetailViewModel: StudentDetailViewModel(studentCellVM: StudentCellViewModel(student: testDataStudents[1])))
//    }
//}
