//
//  URIPoints.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

struct URIPoints {
    static let scheme = "https"
    static let baseURL = "survey-api.nimblehq.co"
    static let pathRegister = "/api/v1/registrations"
    static let pathLogin = "/api/v1/oauth/token"
    static let pathRefresh = "/api/v1/oauth/token"
    static let pathLogout = "/api/v1/oauth/revoke"
    static let pathForgot = "/api/v1/passwords"
    static let pathSubmitSurvey = "/api/v1/responses"
}
