//
//  ArticleListViewModel.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 24/04/25.
//
import Foundation
import Combine

@Observable class ArticleListViewModel: ArticleListViewModelProtocol {
    
    private var cancellables: Set<AnyCancellable> = .init()
    private var networkRequest: Requestable
    private var offset: Int = 0
    var articleList: ArticleListModel?
    var error: NetworkError?
    var query: String = ""
    
    init(networkRequest: Requestable = NetworkRequestable()) {
        self.networkRequest = networkRequest
        receiveAndProcessArticles()

    }
    
    internal func fetchArticles(by query: String) -> AnyPublisher<ArticleListModel, NetworkError> {
        let endPoint = SpaceFlightServiceEndpoints.searchArticles(query: query, offset: offset)
            let request = RequestModel(endpoints: endPoint)
            
            return self.networkRequest.request(request)
    }
    
    func receiveAndProcessArticles(){
        fetchArticles(by: query).sink(
            receiveCompletion: {[weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    // Successfully completed the fetch
                    break
                }
            },
            receiveValue: {[weak self] articleList in
                self?.articleList = articleList
            }).store(in: &cancellables)
    }
    
    func loadMoreArticles(with articleId: Int) {
        let lastArticeId = articleList?.results.last?.id ?? 0
        
        if lastArticeId == articleId {
        offset += 10
        fetchArticles(by: query).sink(
            receiveCompletion: {[weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    // Successfully completed the fetch
                    break
                }
            },
            receiveValue: {[weak self] articleList in
                self?.articleList?.results +=  articleList.results
            }).store(in: &cancellables)
        }
    }
}
