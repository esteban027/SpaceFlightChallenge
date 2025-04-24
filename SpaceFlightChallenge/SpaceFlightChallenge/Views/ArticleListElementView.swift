//
//  ArticleListElementView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 23/04/25.
//

import SwiftUI

struct ArticleListElementView: View {
    var body: some View {
        List {
            VStack {
                HStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .font(.title)
                        .bold()
                    Spacer()
                    AsyncImage(url: URL(string: "http://spaceflightnow.com/wp-content/uploads/2025/03/20250310_Starlink_12-21_prelaunch.jpeg")) { phase in
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
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.gray)

            }
        }
    }
}

#Preview {
    ArticleListElementView()
}
