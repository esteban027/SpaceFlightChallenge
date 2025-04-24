//
//  ArticleDetailView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 23/04/25.
//

import SwiftUI

struct ArticleDetailView: View {
    var body: some View {
        VStack {
            VStack() {
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
                    
                    Text("Hello, World!")
                        .font(.title)
                        .bold()
                        .padding(.bottom)
                    HStack {
                        
                        Text("Authors:")
                            .font(.footnote)
                            .frame(alignment: .leading)
                            .padding(.leading)
                        
                        Text("Pedro Pascal")
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
                        
                        Text("25/04/25")
                            .font(.footnote)
                            .frame(alignment: .leading)
                            .padding(.leading)
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")
                        .frame(alignment: .center)
                        .padding(.horizontal)
                    
                    
                    Link("See More",
                         destination: URL(string: "https://www.example.com/TOS.html")!)
                    .frame(alignment: .leading)
                    .padding(.leading)
                    
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ArticleDetailView()
}
