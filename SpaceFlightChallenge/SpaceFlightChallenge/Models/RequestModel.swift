//
//  RequestModel.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 22/04/25.
//

import Foundation


public struct RequestModel {
    let endpoints: Endpoints
    let body: Data?
    let requestTimeout: Float?
    
    public init(endpoints: Endpoints, requestBody: Data? = nil, requestTimeout: Float? = nil) {
        self.endpoints = endpoints
        self.body = requestBody
        self.requestTimeout = requestTimeout
    }
    
    func getUrlRequest() -> URLRequest? {
        guard let url = endpoints.getUrl() else {
            // Logger
            return nil
        }
        
        var request: URLRequest = URLRequest(url: url)
        
        request.httpMethod = endpoints.method.rawValue
        
        if let headers =  endpoints.headers {
            for header in headers {
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        return request
    }
}

