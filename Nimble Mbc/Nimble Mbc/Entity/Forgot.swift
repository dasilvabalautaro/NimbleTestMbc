//
//  Forgot.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

struct UserEmail: Codable{
    var email: String = ""
}

struct Forgot: Codable{
    var user: UserEmail
    var client_id: String = ""
    var client_secret: String = ""
}
