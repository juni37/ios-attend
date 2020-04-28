//
//  StudentListView.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct StudentListView: View {
    @ObservedObject var studentListViewModel = StudentListViewModel()
    @State var showModal: Bool = false

    var students = testDataStudents

    
    var body: some View {
        NavigationView {
            VStack {
                ReminderView(count: students.count, iconImage: "person.circle.fill", color: Color.blue, descriptionText: "학생")
                List {
                    ForEach(studentListViewModel.studentCellViewModels) { studentCellVM in
                        VStack {
                            StudentSummaryView(studentCellVM: studentCellVM)
                            NavigationLink(destination: StudentSummaryView(studentCellVM: studentCellVM)) {
                                EmptyView().frame(width: 0, height: 0, alignment: .center)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        self.studentListViewModel.removeStudents(atOffsets: indexSet)
                    }
                }
            }
            .navigationBarTitle("학생")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showModal.toggle()}){
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                }
                .sheet(isPresented: $showModal){
                    AddStudentView(studentListVM: self.studentListViewModel, showModal: self.$showModal)
            })
            
        }
    }
    func delete(at offsets: IndexSet) {
        studentListViewModel.studentCellViewModels.remove(atOffsets: offsets)
    }
}

struct StudentListView_Previews: PreviewProvider {
    @State var showModal: Bool = false

    static var previews: some View {
        StudentListView(showModal: false)
    }
}
