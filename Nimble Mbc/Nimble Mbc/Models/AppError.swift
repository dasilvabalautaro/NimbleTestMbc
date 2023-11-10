//
//  AppError.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

enum AppError: Error, Equatable {
    case network(description: String)
    case auth(description: String)
    case unknown(description: String)
    
    var description: String {
        switch self {
        case .network(let value):
            return value
        case .auth(let value):
            return value
        case .unknown(let value):
            return value
        }
    }
}
