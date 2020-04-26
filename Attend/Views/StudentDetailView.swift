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
                ForEach(testDataClasses) { oclass in
                    VStack {
                        ClassSummaryView(classCellVM: ClassCellViewModel(oclass: oclass))
                        NavigationLink(destination: ClassSummaryView(classCellVM: ClassCellViewModel(oclass: oclass))) {
                            EmptyView().frame(width: 0, height: 0, alignment: .center)
                        }
                    }
                }
                
            }
        }
        .navigationBarTitle(studentDetailViewModel.studentCellVM.student.name)
        
    }
}

struct StudentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StudentDetailView(studentDetailViewModel: StudentDetailViewModel(studentCellVM: StudentCellViewModel(student: testDataStudents[1])))
    }
}
