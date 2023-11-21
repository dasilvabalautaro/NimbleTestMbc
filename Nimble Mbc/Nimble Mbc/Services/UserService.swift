//
//  UserService.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation
import Combine

protocol UserServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    func add(postUser: PostUser) -> AnyPublisher<Int, URLSession.DataTaskPublisher.Failure>
    func login(loginUser: Login) -> AnyPublisher<Data, Error>
    func refresh(refreshToken: Refresh) -> AnyPublisher<Data, Error>
    func logout(logoutUser: Logout) -> AnyPublisher<Data, Error>
    func forgot(forgotUser: Forgot) -> AnyPublisher<Data, Error>
}

final class UserService: UserServiceProtocol {
    let networker: NetworkerProtocol
    let headers = HeaderFields()
    var body: Data?
    let jsonEncoder = JSONEncoder()
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func add(postUser: PostUser) -> AnyPublisher<Int,
                                                    URLSession.DataTaskPublisher.Failure> {
        let component = Components(scheme: URIPoints.scheme,
                                   host: URIPoints.baseURL,
                                   path: URIPoints.pathRegister)
        
        self.jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let encodeObject = try self.jsonEncoder.encode(postUser)
            let resultEncode = String(data: encodeObject, encoding: .utf8)
            self.body = resultEncode!.data(using: .utf8)
        } catch {
            return Fail<Int,
                            URLSession.DataTaskPublisher
                .Failure>(error: URLError(URLError.Code.badURL)).eraseToAnyPublisher()
        }
        
        return networker.requestDataEmpty(urlComponents: component, headers: self.headers,
                                     verbsHTTP: VerbsHTTP.post, body: self.body)
            .mapError { _ in
                URLError(URLError.Code.badServerResponse)
            }
            .eraseToAnyPublisher()
    }
    
    func login(loginUser: Login) -> AnyPublisher<Data, Error> {
        let component = Components(scheme: URIPoints.scheme,
                                   host: URIPoints.baseURL,
                                   path: URIPoints.pathLogin)
        
        self.jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let encodeObject = try self.jsonEncoder.encode(loginUser)
            let resultEncode = String(data: encodeObject, encoding: .utf8)
            self.body = resultEncode!.data(using: .utf8)
            
        } catch {
            return Fail<Data, Error>(error: URLError(URLError.Code.badURL)).eraseToAnyPublisher()
        }
        
        return networker.requestData(urlComponents: component, headers: self.headers,
                                     verbsHTTP: VerbsHTTP.post, body: self.body)
            .mapError { _ in
                URLError(URLError.Code.badServerResponse)
            }
            .eraseToAnyPublisher()
    }
    
    func refresh(refreshToken: Refresh) -> AnyPublisher<Data, Error> {
        let component = Components(scheme: URIPoints.scheme,
                                   host: URIPoints.baseURL,
                                   path: URIPoints.pathRefresh)
        
        self.jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let encodeObject = try self.jsonEncoder.encode(refreshToken)
            let resultEncode = String(data: encodeObject, encoding: .utf8)
            self.body = (resultEncode?.data(using: .utf8))!
        } catch {
            return Fail<Data, Error>(error: URLError(URLError.Code.badURL)).eraseToAnyPublisher()
        }
        
        return networker.requestData(urlComponents: component, headers: self.headers,
                                     verbsHTTP: VerbsHTTP.post, body: self.body)
            .mapError { _ in
                URLError(URLError.Code.badServerResponse)
            }
            .eraseToAnyPublisher()
    }
    
    func logout(logoutUser: Logout) -> AnyPublisher<Data, Error>{
        let component = Components(scheme: URIPoints.scheme,
                                   host: URIPoints.baseURL,
                                   path: URIPoints.pathLogout)
        
        self.jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let encodeObject = try self.jsonEncoder.encode(logoutUser)
            let resultEncode = String(data: encodeObject, encoding: .utf8)
            self.body = (resultEncode?.data(using: .utf8))!
        } catch {
            return Fail<Data, Error>(error: URLError(URLError.Code.badURL)).eraseToAnyPublisher()
        }
        
        return networker.requestData(urlComponents: component, headers: self.headers,
                                     verbsHTTP: VerbsHTTP.post, body: self.body)
            .mapError { _ in
                URLError(URLError.Code.badServerResponse)
            }
            .eraseToAnyPublisher()
    }
    
    func forgot(forgotUser: Forgot) -> AnyPublisher<Data, Error>{
        let component = Components(scheme: URIPoints.scheme,
                                   host: URIPoints.baseURL,
                                   path: URIPoints.pathForgot)
        
        self.jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let encodeObject = try self.jsonEncoder.encode(forgotUser)
            let resultEncode = String(data: encodeObject, encoding: .utf8)
            self.body = (resultEncode?.data(using: .utf8))!
        } catch {
            return Fail<Data, Error>(error: URLError(URLError.Code.badURL)).eraseToAnyPublisher()
        }
        
        return networker.requestData(urlComponents: component, headers: self.headers,
                                     verbsHTTP: VerbsHTTP.post, body: self.body)
            .mapError { _ in
                URLError(URLError.Code.badServerResponse)
            }
            .eraseToAnyPublisher()
    }
}
