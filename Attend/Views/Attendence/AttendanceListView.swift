//
//  AttendanceListView.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import SwiftUI

struct AttendanceListView: View {
    @ObservedObject var attendanceListViewModel = AttendanceListViewModel()
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ReminderView(count: attendanceListViewModel.attendanceCellViewModels.count, iconImage: "check.circle.fill", color: Color.blue, descriptionText: "출결율")
                List {
                    ForEach(attendanceListViewModel.attendanceCellViewModels) { attendanceCellVM in
                        VStack {
                            AttendanceSummaryView(attendanceCellVM: attendanceCellVM)
                            NavigationLink(destination: AttendanceSummaryView(attendanceCellVM: attendanceCellVM)) {
                                EmptyView().frame(width: 0, height: 0, alignment: .center)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        self.attendanceListViewModel.removeAttendance(atOffsets: indexSet)
                    }
                }
            }
            .navigationBarTitle("출결 상황")
            
        }
    }
}

struct AttendanceListView_Previews: PreviewProvider {
    @State var showModal: Bool = false

    static var previews: some View {
        AttendanceListView(showModal: false)
    }
}
