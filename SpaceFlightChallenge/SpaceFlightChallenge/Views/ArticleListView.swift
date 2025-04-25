//
//  SwiftUIView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 24/04/25.
//

import SwiftUI

struct ArticleListView: View {
    @Environment(ArticleListViewModel.self) var viewModel
    
    var body: some View {
        if let articleList = viewModel.articleList {
            if articleList.results.isEmpty {
                EmptyView()
            } else {
                List {
                    ForEach(articleList.results) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            ArticleListElementView(article: article)
                                .frame(height: 400)
                                .id(article.id)
                            
                        }.onAppear {
                            viewModel.loadMoreArticles(with: article.id)
                        }
                    }
                }
            }
        } else if let error = viewModel.error {
            ErrorView(error: error)
        }
    }
}

#Preview {
    ArticleListView()
}
