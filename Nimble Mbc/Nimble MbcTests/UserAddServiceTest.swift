//
//  URLSessionMock.swift
//  Nimble MbcTests
//
//  Created by David Silva on 11/21/23.
//

import Combine
import Foundation
import SwiftUI
import XCTest
@testable import Nimble_Mbc

final class UserAddServiceTest: XCTestCase{
    var networker: NetworkerProtocol?
    let headers = HeaderFields()
    var body: Data?
    let jsonEncoder = JSONEncoder()
    var component: Components?
    var user: User?
    var postUser: PostUser?
    let verbs = VerbsHTTP.post
    var cancellables = Set<AnyCancellable>()
    var status = 0
    var err: URLError?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networker = Networker()
    
        user = User(email: "david.silva.baldellon@gmail.com",
                        name: "Arturo Silva",
                        password: "It@pallu123qwe",
                        password_confirmation: "It@pallu123qwe")
        postUser = PostUser(
            user: self.user!,
            client_id: "ofzl-2h5ympKa0WqqTzqlVJUiRsxmXQmt5tkgrlWnOE",
            client_secret: "lMQb900L-mTeU-FVTCwyhjsfBwRCxwwbCitPob96cuU")
        
        do {
            let encodeObject = try self.jsonEncoder.encode(postUser)
            let resultEncode = String(data: encodeObject, encoding: .utf8)
            self.body = resultEncode!.data(using: .utf8)
        } catch {
            throw URLError(URLError.Code.badURL)
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetResponse()  {
        component = Components(scheme: URIPoints.scheme,
                            host: URIPoints.baseURL,
                            path: URIPoints.pathRegister)
        
        networker!.requestDataEmpty(urlComponents: self.component!, headers: self.headers,
                                    verbsHTTP: self.verbs, body: self.body)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        print("\(error.errorCode)")
                    case .finished: break
                }
            } receiveValue: { value in
                self.status = value
                
            }
            .store(in: &cancellables)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(self.status, 422)
        }
        
    }
    
    func testGetResponseFailure()  {
        component = Components(scheme: "htt",
                            host: URIPoints.baseURL,
                            path: URIPoints.pathRegister)
        
        networker!.requestDataEmpty(urlComponents: self.component!, headers: self.headers,
                                    verbsHTTP: self.verbs, body: self.body)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        self.err = error
                    case .finished: break
                }
            } receiveValue: { value in
                print("\(value)")
            }
            .store(in: &cancellables)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(self.err, URLError(URLError.Code.badServerResponse))
        }
        
    }
}
