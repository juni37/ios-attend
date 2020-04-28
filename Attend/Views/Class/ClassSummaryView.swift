//
//  ClassSummaryView.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import SwiftUI

struct ClassSummaryView: View {
    @ObservedObject var classCellVM: ClassCellViewModel
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                Text(classCellVM.currentClass.time)
                    .foregroundColor(Color.black.opacity(0.5))
                    .bold()
                    .font(.caption)
                Text(classCellVM.currentClass.name)
                    .font(.title)
                    .bold()
            }.padding()
            Spacer()
            Text("학생: \(classCellVM.currentClass.students.count)명")
                .font(.footnote)
                .padding()
                .offset(x: 0, y: 20)
        }
        .background(Color.black.opacity(0.03))
        .cornerRadius(20)
        .onAppear{
            UITableView.appearance().separatorColor = .clear
        }
    }
}
