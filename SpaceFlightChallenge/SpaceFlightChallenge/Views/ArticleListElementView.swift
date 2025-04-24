//
//  ArticleListElementView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 23/04/25.
//

import SwiftUI

struct ArticleListElementView: View {
    var article: ArticleModel
    var body: some View {
        VStack {
            HStack {
                Text(article.title)
                    .font(.title)
                    .bold()
                Spacer()
                AsyncImage(url: URL(string: article.imageURL)) { phase in
                    if let image = phase.image {
                        // Displays the loaded image.
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        ImageErrorView(error: phase.error)
                    } else {
                        ProgressView()
                    }
                    
                }
                .frame(width: 100, height: 100)
                
            }
            
            Text(article.summary)
                .foregroundStyle(.gray)
            
        }
    }
}

#Preview {
    ArticleListElementView(article: ArticleModel(id: 0, title: "test", authors: [], imageURL: "no Image", url: "No URL", summary: "No Summary", publishedAt: " No Date"))
}
