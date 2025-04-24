//
//  NetworkRequestable.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 23/04/25.
//

import Foundation
import Combine

public class NetworkRequestable: Requestable {
    public var requestTimeOut: Float = 30
    
    public func request<T>(_ urlRequest: RequestModel) -> AnyPublisher<T, NetworkError> where T : Codable {
        let sessionConfig = URLSessionConfiguration.default
        
        sessionConfig.timeoutIntervalForRequest = TimeInterval(urlRequest.requestTimeout ?? requestTimeOut)
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest.getUrlRequest()!)
            .tryMap { output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "Server Error")
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError{ error in
                NetworkError.invalidJSON(String(describing: error))
            }
            .eraseToAnyPublisher()
    }
}


