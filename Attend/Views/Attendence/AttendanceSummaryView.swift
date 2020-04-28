//
//  AttendanceSummaryView.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct AttendanceSummaryView: View {
    @ObservedObject var attendanceCellVM: AttendanceCellViewModel
    @State var isPresented: Bool = false
    
    var body: some View {
        HStack {
            Text(attendanceCellVM.attendance.date.description)
                .font(.body)
                .bold()
            Spacer()
            
            TextButton(buttonTitle: attendanceCellVM.attendance.status.rawValue, buttonColor: Color.black.opacity(0.03))
            
        }
    }
}

