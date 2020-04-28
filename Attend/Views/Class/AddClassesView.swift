//
//  AddClassesView.swift
//  Attend
//
//  Created by David Yoon on 4/26/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct AddClassesView: View {
    @State var classListVM: ClassListViewModel
    @State var classTitle: String = ""
    @State var timeLabel: String = ""
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    HStack {
                        TextField("1학년 1반", text: $classTitle)
                    }
                    .padding()
                    
                    HStack {
                        TextField("7:00 - 8:00", text: $timeLabel)
                    }.padding()
                }
            }
            .navigationBarTitle("수업 추가")
            .navigationBarItems(trailing: Button(action: {
                self.classListVM.addClass(oclass: Class(id: UUID().uuidString, name: self.classTitle, time: self.timeLabel, students: []))
                self.showModal.toggle()
            }) {
                Text("수업 추가")
            })

        }
    }
}

