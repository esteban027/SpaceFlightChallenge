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
    case searchArticles(query: String)
    
    var baseURL: String {
        switch self {
        case .articles, .articleById, .searchArticles:
            return "api.spaceflightnewsapi.net"
        }
    }
    
    var path: String {
        switch self {
        case .articles, .articleById, .searchArticles:
            return "/v4/articles/"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .articles:
            return nil
        case .articleById(Id: let Id):
            return [URLQueryItem(name: "id", value: Id)]
        case .searchArticles(query: let query):
            return [URLQueryItem(name: "search", value: query)]
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
        case .articles, .articleById, .searchArticles:
            return .get
        }
        
    }
}
