//
//  TextButton.swift
//  Explore
//
//  Created by David Yoon on 4/19/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct TextButton: View {
    @State var buttonTitle : String
    @State var buttonColor : Color
    
    var body: some View {
        Button(action: {
        }) {
            Text(buttonTitle)
            .bold()
        }.buttonStyle(RequestButtonStyle(buttonColor: buttonColor))
    }
}

struct ChangeAttendanceButton: View {
    @State var buttonTitle : String
    @State var buttonColor : Color
    @State var status: Status
    @ObservedObject var studentCellVM: StudentCellViewModel
    
    
    var body: some View {
        Button(action: {
            self.studentCellVM.attendanceRepository.addAttendance(Attendance(student: self.studentCellVM.student, attendedClass: self.studentCellVM.student.classes[0], date: Date(), status: self.status))
        }) {
            Text(buttonTitle)
            .bold()
        }.buttonStyle(RequestButtonStyle(buttonColor: buttonColor))
    }
}


struct RequestButtonStyle: ButtonStyle {
    @State var buttonColor : Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size: 12))
            .foregroundColor(.black)
            .padding(EdgeInsets(top: 7, leading: 15, bottom: 7, trailing: 15))
            .frame(height: 35, alignment: .center)
            .background(buttonColor)
            .cornerRadius(10)
        
    }
}


struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(buttonTitle: "Request", buttonColor: Color.black.opacity(0.1))
    }
}
