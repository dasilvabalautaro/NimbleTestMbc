//
//  MessageAlert.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/8/23.
//

import Foundation

enum TypeMessage: Int, CaseIterable {
    case success
    case error
}

struct MessageAlert: Identifiable, Equatable {
    let id = UUID()
    var text = ""
    var type = TypeMessage.success
    
}
