//
//  SpaceFlightServiceEndpoints.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 23/04/25.
//

import Foundation

enum SpaceFlightServiceEndpoints: Endpoints {
    
    case articleById(Id : String)
    case searchArticles(query: String, offset: Int)
    
    var baseURL: String {
        switch self {
        case .articleById, .searchArticles:
            return "api.spaceflightnewsapi.net"
        }
    }
    
    var path: String {
        switch self {
        case .articleById, .searchArticles:
            return "/v4/articles/"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .articleById(Id: let Id):
            return [URLQueryItem(name: "id", value: Id)]
        case .searchArticles(query: let query, offset: let offset):
            return [URLQueryItem(name: "search", value: query),
                    URLQueryItem(name: "offset", value: String(offset))]
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
        case .articleById, .searchArticles:
            return .get
        }
        
    }
}
