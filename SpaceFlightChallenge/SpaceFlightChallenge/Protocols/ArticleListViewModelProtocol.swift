//
//  ArticleListViewModelProtocol.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 24/04/25.
//

import Combine

protocol ArticleListViewModelProtocol {
    var articleList: ArticleListModel? { get }
    var error : NetworkError? { get }
    
    func fetchArticles(by query: String) -> AnyPublisher<ArticleListModel, NetworkError>
}
