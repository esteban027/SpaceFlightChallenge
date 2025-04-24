//
//  Endpoints.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 22/04/25.
//

import Foundation

public protocol Endpoints {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    var method: HTTPMethod { get }
    
    func getUrl() -> URL?
    
}

extension Endpoints {
    public func getUrl() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL
        components.path = path
        components.queryItems = parameters ?? []
        return components.url
    }
}
