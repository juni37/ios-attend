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

    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                Text("\(studentCellVM.student.classes.count)")
                    .foregroundColor(Color.black.opacity(0.5))
                    .bold()
                    .font(.caption)
                Text(studentCellVM.student.name)
                    .font(.title)
                    .bold()
            }.padding()
            Spacer()
            Text("수업: \(studentCellVM.student.classes.count)개")
                .font(.footnote)
                .padding()
                .offset(x: 0, y: 20)
        }
        .background(Color.init(studentCellVM.color).opacity(0.3))
        .cornerRadius(20)
        .onAppear{
            UITableView.appearance().separatorColor = .clear
        }
    }
}
