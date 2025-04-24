//
//  ContentView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 22/04/25.
//

import SwiftUI

struct ArticleListView: View {
    var viewModel = ArticleListViewModel()
    
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
    }
}

#Preview {
    ArticleListView()
}
