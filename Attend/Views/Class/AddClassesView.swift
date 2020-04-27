//
//  AddClassesView.swift
//  Attend
//
//  Created by David Yoon on 4/26/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct AddClassesView: View {
    @State var classTitle: String = ""
    @State var timeLabel: String = ""
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Form {
                Text("수업이름")
                HStack {
                    Image(systemName: "plus.circle.fill").foregroundColor(.gray)
                    Spacer()
                    TextField("i.e. AP Calculus", text: $classTitle)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                
                Text("시간")
                HStack {
                    Image(systemName: "clock").foregroundColor(.gray)
                    Spacer()
                    TextField("7:00 - 9:00", text: $timeLabel)
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

struct AddClassesView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassesView(showModal: .constant(true))
    }
}
