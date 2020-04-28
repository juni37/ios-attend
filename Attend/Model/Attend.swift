//
//  Attend.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation

enum Status: String, Codable {
    case 출석
    case 결석
    case 지각
    case 조퇴
}

struct Attend: Codable, Identifiable {
    var id: String = UUID().uuidString
    var student: Student
    var attendedClass: Class
    var date: Date
    var status: Status
}

#if DEBUG
var testDataAttend = [
    Attend(id: UUID().uuidString, student: Student(id: "", name: "", classes: [], attendance: []), attendedClass: Class(id: "", name: "", time: "", students: []), date: Date(), status: Status.출석),
    Attend(id: UUID().uuidString, student: Student(id: "", name: "", classes: [], attendance: []), attendedClass: Class(id: "", name: "", time: "", students: []), date: Date(), status: Status.출석)
]
#endif
