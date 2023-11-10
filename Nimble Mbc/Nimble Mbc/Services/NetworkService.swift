//
//  NetworkService.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/7/23.
//

import Foundation
import Combine
import Resolver

protocol NetworkerProtocol: AnyObject {    
    func request<T>(type: T.Type,
                urlComponents: Components,
                headers: HeaderFields, verbsHTTP: VerbsHTTP, 
                body: Data?) -> AnyPublisher<T, Error> where T: Decodable
    
    func requestData(urlComponents: Components, headers: HeaderFields,
                 verbsHTTP: VerbsHTTP, body: Data?) -> AnyPublisher<Data, URLError>
    
    func requestDataEmpty(urlComponents: Components, headers: HeaderFields,
                     verbsHTTP: VerbsHTTP, body: Data?) -> AnyPublisher<Int,
                                                                            URLSession.DataTaskPublisher.Failure>
}

final class Networker: NetworkerProtocol {
    private var urlComponentsService = URLComponentsService()
    private var urlHeaderFieldsService = URLHeaderFieldsService()
    
    func request<T>(type: T.Type,
                urlComponents: Components,
                headers: HeaderFields, verbsHTTP: VerbsHTTP, 
                body: Data?) -> AnyPublisher<T, Error> where T : Decodable {
        
        guard let url = urlComponentsService.requestComponents(urlComponents: urlComponents).url else {
            return Fail<T, Error>(error: AppError.network(description: "URL Components bad"))
                .eraseToAnyPublisher()
        }
        
        let urlRequest = urlHeaderFieldsService.urlHeaderFields(url: url,
                                                                headerFields: headers,
                                                                body: body,
                                                                verbsHTTP: verbsHTTP)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func requestData(urlComponents: Components, headers: HeaderFields, 
                 verbsHTTP: VerbsHTTP, body: Data?) -> AnyPublisher<Data, URLError> {
        
        guard let url = urlComponentsService.requestComponents(urlComponents: urlComponents).url else {
            return Fail<Data, URLError>(error: URLError(URLError.Code.badURL))
                .eraseToAnyPublisher()
            
        }
        
        let urlRequest = urlHeaderFieldsService.urlHeaderFields(url: url,
                                                                headerFields: headers,
                                                                body: body,
                                                                verbsHTTP: verbsHTTP)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
    func requestDataEmpty(urlComponents: Components, headers: HeaderFields,
                     verbsHTTP: VerbsHTTP, body: Data?) -> AnyPublisher<Int,
                                                                            URLSession.DataTaskPublisher.Failure> {
                                                                                
        guard let url = urlComponentsService.requestComponents(urlComponents: urlComponents).url else {
            return Fail<Int, URLSession.DataTaskPublisher.Failure>(error: URLError(URLError.Code.badURL))
                .eraseToAnyPublisher()
        }
        
        let urlRequest = urlHeaderFieldsService.urlHeaderFields(url: url,
                                                                headerFields: headers,
                                                                body: body,
                                                                verbsHTTP: verbsHTTP)
                                                                                
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .compactMap { $0.response as? HTTPURLResponse }
            .map(\.statusCode)
            .eraseToAnyPublisher()
    }
}

