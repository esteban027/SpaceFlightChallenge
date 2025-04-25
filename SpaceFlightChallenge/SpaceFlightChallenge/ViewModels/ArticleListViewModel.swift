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
    var query: String = ""
    
    init(networkRequest: Requestable = NetworkRequestable()) {
        self.networkRequest = networkRequest
        receiveAndProcessArticles()

    }
    
    internal func fetchArticles(by query: String) -> AnyPublisher<ArticleListModel, NetworkError> {
            let endPoint = SpaceFlightServiceEndpoints.searchArticles(query: query)
            let request = RequestModel(endpoints: endPoint)
            
            return self.networkRequest.request(request)
    }
    
    func 
    essArticles(){
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
}
