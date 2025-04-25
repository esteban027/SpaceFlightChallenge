//
//  ArticleDetailView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 23/04/25.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: ArticleModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        ScrollView{
            VStack {
                VStack() {
                    AsyncImage(url: URL(string: article.imageURL)) { phase in
                        if let image = phase.image {
                            // Displays the loaded image.
                            HStack {
                            if horizontalSizeClass != .compact {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 400, height: 400)
                            } else {
                                image
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    } else if phase.error != nil {
                        ErrorView(error: phase.error)
                    } else {
                        ProgressView()
                    }
                    
                    Text(article.title)
                        .font(.title)
                        .bold()
                        .padding(.bottom)
                    HStack {
                        
                        Text("Authors:")
                            .font(.footnote)
                            .frame(alignment: .leading)
                            .padding(.leading)
                        
                        Text(article.authors.map { $0.name }.joined(separator: ", "))
                            .font(.footnote)
                            .frame(alignment: .leading)
                            .padding(.leading)
                        Spacer()
                    }
                    
                    HStack {
                        
                        Text("Published At:")
                            .font(.footnote)
                            .frame(alignment: .leading)
                            .padding(.leading)
                        
                        Text(article.publishedAt)
                            .font(.footnote)
                            .frame(alignment: .leading)
                            .padding(.leading)
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    Text(article.summary)
                        .frame(alignment: .center)
                        .padding(.horizontal)
                    
                    
                    Link("See More",
                         destination: URL(string: article.url)!)
                    .frame(alignment: .leading)
                    .padding(.leading)
                    
                }
            }
            Spacer()
        }
    }
}
}

#Preview {
    ArticleDetailView(article: ArticleModel(id: 0, title: "test", authors: [], imageURL: "no Image", url: "No URL", summary: "No Summary", publishedAt: " No Date"))
}
