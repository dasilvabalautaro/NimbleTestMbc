//
//  Refresh.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

struct Refresh: Codable{
    var grant_type: String = ""
    var refresh_token: String = ""
    var client_id: String = ""
    var client_secret: String = ""
}
