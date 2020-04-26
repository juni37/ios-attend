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
    Class(name: "iOS Programming", time: "7:00 - 9:00", students: ["david", "chris"], color: colorList[1]),
    Class(name: "iOS Refactoring", time: "6:00 - 10:00", students: ["david", "chris"], color: colorList[2])
]
#endif
