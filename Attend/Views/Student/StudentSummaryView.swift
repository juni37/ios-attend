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
            TextButton(buttonTitle: "출석", buttonColor: Color.green.opacity(0.7))
        }
    }
}
