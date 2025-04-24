//
//  NetworkError.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 23/04/25.
//

import Foundation

public enum NetworkError: Error, Equatable {
    case badURL(_ error: String)
    case apiError(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_error: String)
    case unableToParseData(_ error: String)
    case invalidJSON(_ error: String)
    case unknown(code: Int, error: String)
}
