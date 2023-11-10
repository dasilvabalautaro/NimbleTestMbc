//
//  Components.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

struct Components {
    var scheme: String
    var host: String
    var path: String
    var queryItems = [URLQueryItem]()
    
    mutating func addQueryItem(urlQueryItem: URLQueryItem){
        queryItems.append(urlQueryItem)
    }
}
