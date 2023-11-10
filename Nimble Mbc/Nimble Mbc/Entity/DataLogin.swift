//
//  DataLogin.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/8/23.
//

import Foundation

struct Attributes: Codable{
    var access_token: String = ""
    var token_type: String = ""
    var expires_in: UInt = 0
    var refresh_token: String =  ""
    var created_at: UInt64
}

struct DataHead: Codable{
    var id: String = ""
    var type: String = "token"
    var attributes: Attributes
}

struct DataLogin: Codable {
    var data: DataHead
}
