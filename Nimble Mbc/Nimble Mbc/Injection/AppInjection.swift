//
//  AppInjection.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        defaultScope = .graph
        register { UserViewModel() }
        register { SplashViewModel() }
        register { ForgotViewModel() }
        register { MenuViewModel() }
    }
}
