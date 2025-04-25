//
//  MockNetworkRequestable.swift
//  SpaceFlightChallengeTests
//
//  Created by Daniel esteban Bermudez valenzuela on 24/04/25.
//

import Foundation
import XCTest
import Combine
@testable import SpaceFlightChallenge

class MockNetworkRequestable: Requestable {
    var result: Result<any Codable, NetworkError>
    let requestTimeOut: Float = 60.0

    init<T: Codable>(result: Result<T, NetworkError>) {
        self.result = result.map { $0 as Codable }
    }

    func request<T: Codable>(_ urlRequest: RequestModel) -> AnyPublisher<T, NetworkError> {
        return result.publisher
            .tryMap { result -> T in
                guard let typedResult = result as? T else {
                    throw NetworkError.unknown(code: 100, error: "Unkowon error")
                }
                return typedResult
            }
            .mapError { $0 as? NetworkError ?? NetworkError.unknown(code: 100, error: "Unkowon error") }
            .eraseToAnyPublisher()
    }
}
