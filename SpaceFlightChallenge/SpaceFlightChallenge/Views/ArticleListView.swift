//
//  ContentView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 22/04/25.
//

import SwiftUI

struct ArticleListView: View {
    @State  var viewModel = ArticleListViewModel()
    //   @Binding var selectedArticle: Article?
    
    var body: some View {
        if let articleList = viewModel.articleList {
            ScrollViewReader { scrollProxy in
                NavigationSplitView {
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
        }
    }
}
        
        #Preview {
            ArticleListView()
        }
