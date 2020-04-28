//
//  AddStudentView.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct AddStudentView: View {
    @State var studentName: String = ""
    @State var oclass: String = ""
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
                        TextField("1학년 1반", text: $oclass)
                    }.padding()
                }
            }
            .navigationBarTitle("학생 추가")
            .navigationBarItems(trailing: Button(action: {
                self.showModal.toggle()
            }) {
                Text("학생 추가")
            })
            
        }
    }
}
