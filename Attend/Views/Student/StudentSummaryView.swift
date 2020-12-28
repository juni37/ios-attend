//
//  StudentSummaryView.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct StudentSummaryView: View {
    @ObservedObject var studentCellVM: StudentCellViewModel
    @State var isPresented: Bool = false
    
    var body: some View {
        HStack {
            Text(studentCellVM.student.name)
                .font(.body)
                .bold()
            Spacer()
            
            Group {
                if studentCellVM.student.classes.count > 0 {
                    TextButton(buttonTitle: studentCellVM.student.classes[0].name, buttonColor: Color.black.opacity(0.03))
                } else {
                    TextButton(buttonTitle: "반배정 필요", buttonColor: Color.black.opacity(0.03))
                }
            }
        }
    }
}
