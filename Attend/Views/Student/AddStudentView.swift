//
//  AddStudentView.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct AddStudentView: View {
    @State var studentListVM: StudentListViewModel
    @State var studentName: String = ""
    @State var oclass: Class?
    @State var selection: Int = 0
    
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    HStack {
                        TextField("학생 이름", text: $studentName)
                    }
                    .padding()
                    
                    HStack {
                        Picker(selection: $selection, label: Text("수업")) {
                            ForEach(0 ..< self.studentListVM.classRepository.classes.count) {
                                Text(self.studentListVM.classRepository.classes[$0].name).tag($0)
                            }
                            
                        }
                    }.padding()
                }
            }
            .navigationBarTitle("학생 추가")
            .navigationBarItems(trailing: Button(action: {
                
                if self.studentListVM.classRepository.classes.count < self.selection {
                    self.studentListVM.addStudent(student: Student(id: UUID().uuidString, name: self.studentName, classes: [], attendance: []))
                }
                self.studentListVM.addStudent(student: Student(id: UUID().uuidString, name: self.studentName, classes: [self.studentListVM.classRepository.classes[self.selection]], attendance: []))
                self.showModal.toggle()
            }) {
                Text("학생 추가")
            })
            
        }
    }
}
