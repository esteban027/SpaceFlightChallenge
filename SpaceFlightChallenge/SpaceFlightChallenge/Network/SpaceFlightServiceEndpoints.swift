//
//  SpaceFlightServiceEndpoints.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 23/04/25.
//

import Foundation

enum SpaceFlightServiceEndpoints: Endpoints {
    
    case articles
    case articleById(Id : String)
    
    var baseURL: String {
        switch self {
        case .articles, .articleById:
            return "api.spaceflightnewsapi.net"
        }
    }
    
    var path: String {
        switch self {
        case .articles, .articleById:
            return "/v4/articles/"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .articles:
            return nil
        case .articleById(Id: let Id):
            return [URLQueryItem(name: "id", value: Id)]
        }
    }
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .articles, .articleById:
            return .get
        }
        
    }
}
