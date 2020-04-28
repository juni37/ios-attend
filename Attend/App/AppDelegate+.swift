//
//  AppDelegate+.swift
//  Attend
//
//  Created by David Yoon on 4/28/20.
//  Copyright © 2020 OurSpace. All rights reserved.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    // register application components
    register { AuthenticationService() }.scope(application)
    register { LocalClassRepository() as ClassRepository }.scope(application)
  }
}
