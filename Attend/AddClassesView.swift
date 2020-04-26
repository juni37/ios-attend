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

    var body: some View {
        NavigationView {
            
            Form {
                
                Text("수업이름")
                TextField("i.e. AP Calculus", text: $classTitle)
                
                Text("시간")
                TextField("7:00 - 9:00", text: $timeLabel)
                Button(action: {
                    //backend
                }) {
                    Text("ENTER")
                }

            }
            .navigationBarTitle("수업관리")
        }

    }
}

//NavigationView {
//    VStack {
//        HStack{
//            Text("수업이름")
//            TextField("i.e. AP Calculus", text: $classTitle)
//        }
//        .padding()
//        HStack {
//            Text("시간")
//            TextField("7:00 - 9:00", text: $timeLabel)
//        }
//        .padding()
//        Button(action: {
//            //backend
//        }) {
//            Text("ENTER")
//                .foregroundColor(.black)
//        }
//    }
//    .padding()
//    .border(Color.black, width: 1)
//
//    .navigationBarTitle("수업관리")
//    .frame(width: 400, height: 500, alignment: .top)
//
//}

struct AddClassesView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassesView()
    }
}
