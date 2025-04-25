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
       NavigationSplitView {
           
           if let articleList = viewModel.articleList {
              
               List {
                   ForEach(articleList.results) { article in
                       NavigationLink(destination: ArticleDetailView(article: article)) {
                         ArticleListElementView(article: article)
                           .frame(height: 400)
                      
                   }
                   }
               }
               .navigationTitle("SpaceFlight News")
               
           } else {
               if viewModel.fetchFailed {
                   ErrorView(error: nil)
               } else {
                   ProgressView()
               }
           }
       }
        detail: {
           Text("Select a Landmark")
       }
        .searchable(text: $viewModel.query)
        .onSubmit(of: .search) {
            viewModel.receiveAndProcessArticles()
        }
        .onChange(of: viewModel.query) {_ , newQuery in
            if newQuery.isEmpty {
                viewModel.receiveAndProcessArticles()
            }
        }
        
        
    }
}

#Preview {
    ArticleListView()
}
