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
                ForEach(testDataStudents) { student in
                    VStack {
                        ClassSummaryView(studentCellVM: StudentCellViewModel(student: student))
                        NavigationLink(destination: StudentSummaryView(studentCellVM: StudentCellViewModel(student: student))) {
                            EmptyView().frame(width: 0, height: 0, alignment: .center)
                        }
                    }
                }
                
            }
        }
        .navigationBarTitle(classDetailViewModel.classCellVM.currentClass.name)
        
    }
}

struct StudentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StudentDetailView()
    }
}
