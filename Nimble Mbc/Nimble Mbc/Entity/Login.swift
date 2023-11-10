//
//  Login.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

struct Login: Codable{
    var grant_type: String = ""
    var email: String = ""
    var password: String = ""
    var client_id: String = ""
    var client_secret: String = ""
}
