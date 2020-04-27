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
        VStack {
            Form {
                Text("학생이름")
                HStack {
                    Image(systemName: "plus.circle.fill").foregroundColor(.gray)
                    Spacer()
                    TextField("이름", text: $studentName)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                
                Text("수업")
                HStack {
                    Image(systemName: "clock").foregroundColor(.gray)
                    Spacer()
                    TextField("수업", text: $oclass)
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
            Button(action: {
                self.showModal.toggle()
            }) {
                Text("수업 추가")
            }
        }
    }
}
