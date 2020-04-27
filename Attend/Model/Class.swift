//
//  Class.swift
//  Attend
//
//  Created by David Yoon on 4/26/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import UIKit

struct Class: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var time: String
    var students: [String]
    var color: UIColor
    let colorList: [UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.orange, UIColor.purple]
}

#if DEBUG
let colorList: [UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.orange, UIColor.purple]
var testDataClasses = [
    Class(name: "2학년 2반", time: "9:00 - 10:00", students: ["윤석준", "김유준"], color: colorList[1]),
    Class(name: "2학년 4반", time: "11:00 - 12:00", students: ["윤석준", "김유준"], color: colorList[2])
]
#endif
