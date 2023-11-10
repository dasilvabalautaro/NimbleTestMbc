//
//  User.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

struct User: Codable {
    var email: String = ""
    var name: String = ""
    var password: String = ""
    var password_confirmation: String = ""
}

struct PostUser: Codable{
    var user: User
    var client_id: String = ""
    var client_secret: String = ""
}
