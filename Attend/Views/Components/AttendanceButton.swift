//
//  TripleButton.swift
//  Explore
//
//  Created by David Yoon on 4/19/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct AttendanceButton: View {
    @ObservedObject var studentCellVM: StudentCellViewModel

    var body: some View {
        HStack {
            ChangeAttendanceButton(buttonTitle: "출석", buttonColor: Color.green.opacity(0.7), status: Status.출석, studentCellVM: studentCellVM)
            ChangeAttendanceButton(buttonTitle: "지각", buttonColor: Color.purple.opacity(0.7), status: Status.지각, studentCellVM: studentCellVM)
            
            ChangeAttendanceButton(buttonTitle: "결석", buttonColor: Color.red.opacity(0.7), status: Status.결석, studentCellVM: studentCellVM)
            ChangeAttendanceButton(buttonTitle: "조퇴", buttonColor: Color.blue.opacity(0.7), status: Status.조퇴, studentCellVM: studentCellVM)
            
        }.padding()
        
    }
}


struct AttendanceButton_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceButton(studentCellVM: StudentCellViewModel(student: Student(id: "", name: "David", classes: [], attendance: [])))
    }
}
