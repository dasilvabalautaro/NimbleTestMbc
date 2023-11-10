//
//  HeaderFields.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

struct HeaderFields {
    var headers = [String: String]()
    
    init() {
        headers.updateValue("application/json; charset=UTF-8",
                            forKey: StandardResponseFields.CONTENT_TYPE)  
    }
    
    mutating func addHeader(key: String, value: String) {
        _ = headers.updateValue(value, forKey: key)
    }
}
