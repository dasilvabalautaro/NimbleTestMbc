//
//  URLHeaderFieldsService.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

struct URLHeaderFieldsService {
    func urlHeaderFields(url: URL,
                         headerFields: HeaderFields,
                         body: Data?, verbsHTTP: VerbsHTTP) -> URLRequest {
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData)
        for (key, value) in headerFields.headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        urlRequest.httpMethod = verbsHTTP.rawValue
        if body != nil {
            urlRequest.httpBody = body
        }
        urlRequest.timeoutInterval = TimeInterval(StandardResponseFields.REQUEST_TIMEOUT)
        return urlRequest
    }
}
