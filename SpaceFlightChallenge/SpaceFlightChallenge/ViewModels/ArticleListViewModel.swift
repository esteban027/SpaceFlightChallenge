//
//  ArticleListViewModel.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 24/04/25.
//
import Foundation
import Combine

@Observable class ArticleListViewModel: ArticleListViewModelProtocol {
   
    //private let articleListPublisher = PassthroughSubject<ArticleListModel, Never>()
    private var cancellables: Set<AnyCancellable> = .init()
    private var networkRequest: Requestable
    var articleList: ArticleListModel?
    var error: NetworkError?
    var fetchFailed: Bool = false
    
    init(networkRequest: Requestable = NetworkRequestable()) {
        self.networkRequest = networkRequest
        fetchArticles(by: nil).sink(
            receiveCompletion: {[weak self] error in
               // self?.error = error
                //self?.fetchFailed = true
            },
            receiveValue: {[weak self] articleList in
                self?.articleList = articleList
            }).store(in: &cancellables)
    }
    
    func fetchArticles(by query: String?) -> AnyPublisher<ArticleListModel, NetworkError> {
        if let query {
            let endPoint = SpaceFlightServiceEndpoints.searchArticles(query: query)
            let request = RequestModel(endpoints: endPoint)
            
            return self.networkRequest.request(request)
        } else {
            let endPoint = SpaceFlightServiceEndpoints.articles
            let request = RequestModel(endpoints: endPoint)
            
            return self.networkRequest.request(request)
        }
    }
}
