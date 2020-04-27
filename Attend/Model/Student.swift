//
//  Student.swift
//  Attend
//
//  Created by David Yoon on 4/27/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import UIKit

struct Student: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var classes: [Class]
}

#if DEBUG
var testDataStudents = [
    Student(name: "김유준", classes: [testDataClasses[0], testDataClasses[1]]),
    Student(name: "윤석준", classes: [testDataClasses[0], testDataClasses[1]])
]
#endif
