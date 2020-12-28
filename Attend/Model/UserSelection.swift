//
//  UserSelection.swift
//  SlideIn
//
//  Created by Sud on 6/23/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import Combine
import SwiftUI

final class UserSelection:ObservableObject {
    let didChange = PassthroughSubject<UserSelection, Never>()
    
    var showSideMenu: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    
}
