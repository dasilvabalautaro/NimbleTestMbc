//
//  Colors.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import Foundation
import SwiftUI

public extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = (rgbValue & 0xff)
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff, opacity: 1)
    }
    
    static let primaryLight = Color.init(hex: "00796B")
    static let primaryVariant = Color.init(hex: "004D40")
    static let secondary = Color.init(hex: "81D4FA")
    static let secondaryVariant = Color.init(hex: "01579B")
    static let background = Color.init(hex: "FFFFFF")
    static let surface = Color.init(hex: "FFFFFF")
    static let lightFront = Color.init(hex: "80CBC4")
    static let lightBack = Color.init(hex: "CF6679")
    static let backgroundTextField = Color.init(hex: "454342")
    static let placeholder = Color.init(hex: "8A8A89")
}
