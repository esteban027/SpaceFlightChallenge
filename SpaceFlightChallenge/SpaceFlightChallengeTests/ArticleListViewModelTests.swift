//
//  SpaceFlightChallengeTests.swift
//  SpaceFlightChallengeTests
//
//  Created by Daniel esteban Bermudez valenzuela on 22/04/25.
//

import XCTest
import Combine
@testable import SpaceFlightChallenge

final class ArticleListViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func testFetchArticlesSuccess() {
        let testArticles = ArticleListModel(next: nil,
                                            previous: nil,
                                            results: [ArticleModel(id: 1, title: "test", authors: [], imageURL: "no Image", url: "No URL", summary: "No Summary", publishedAt: " No Date"),
                                                      ArticleModel(id: 2, title: "test", authors: [], imageURL: "no Image", url: "No URL", summary: "No Summary", publishedAt: " No Date")])
        let fakeNetwork = MockNetworkRequestable(result: .success(testArticles))
        
        let viewModel = ArticleListViewModel(networkRequest: fakeNetwork)
        
        let expectation = self.expectation(description: "Successful fetch")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertNotNil(viewModel.articleList, "Article list should not be nil")
            XCTAssertEqual(viewModel.articleList?.results.count, 2, "There should be two articles")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchArticlesFailure() {
        let failureResult: Result<ArticleListModel, NetworkError> = .failure(
            NetworkError.serverError(code: 500, error: "Mock Error")
        )
        let fakeNetwork = MockNetworkRequestable(result: failureResult)
        let viewModel = ArticleListViewModel(networkRequest: fakeNetwork)
        
        let expectation = self.expectation(description: "Failed fetch")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertNotNil(viewModel.error, "Error should be set")
            
            if case let .serverError(code, errorMessage) = viewModel.error {
                XCTAssertEqual(code, 500, "Error code should be 500")
                XCTAssertEqual(errorMessage, "Mock Error", "Error message should match 'Mock Error'")
            } else {
                XCTFail("Error should be of type NetworkError.serverError")
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
