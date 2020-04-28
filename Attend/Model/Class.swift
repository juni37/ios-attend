//
//  Class.swift
//  Attend
//
//  Created by David Yoon on 4/26/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import UIKit

struct Class: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var time: String
    var students: [Student]
}
