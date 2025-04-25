//
//  ContentView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 22/04/25.
//

import SwiftUI

struct SpaceFlightNewsContentView: View {
    @State  var viewModel = ArticleListViewModel()
    
    var body: some View {
        if let articleList = viewModel.articleList {
            ScrollViewReader { scrollProxy in
                NavigationSplitView {
                    ArticleListView()
                        .navigationTitle("SpaceFlight News")
                }
                detail: {
                    if let article = articleList.results.first {
                        ArticleDetailView(article: article)
                    } else {
                        ProgressView()
                    }
                }
                .searchable(text: $viewModel.query, placement: .navigationBarDrawer(displayMode: .always))
                .onSubmit(of: .search) {
                    viewModel.receiveAndProcessArticles()
                    if let firstArticleID = articleList.results.first?.id {
                        scrollProxy.scrollTo(firstArticleID, anchor: .top)
                    }
                }
                .onChange(of: viewModel.query) {_ , newQuery in
                    if newQuery.isEmpty {
                        viewModel.receiveAndProcessArticles()
                        if let firstArticleID = articleList.results.first?.id {
                            scrollProxy.scrollTo(firstArticleID, anchor: .top)
                        }
                        
                    }
                }
            }
            .environment(viewModel)
        }
    }
}

#Preview {
    SpaceFlightNewsContentView()
}
