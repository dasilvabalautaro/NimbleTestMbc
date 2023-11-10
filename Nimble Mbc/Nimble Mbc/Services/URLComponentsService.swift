//
//  URLComponentsService.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation

struct URLComponentsService {
    
    func requestComponents(urlComponents: Components) -> URLComponents {
        var components = URLComponents()
        components.scheme = urlComponents.scheme
        components.host = urlComponents.host
        components.path = urlComponents.path
        if (!urlComponents.queryItems.isEmpty){
            components.queryItems = urlComponents.queryItems
        }
        
        return components
    }
}
