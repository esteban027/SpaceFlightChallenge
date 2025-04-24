//
//  ContentView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 22/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       NavigationSplitView {
           VStack {
               Image(systemName: "globe")
                   .imageScale(.large)
                   .foregroundStyle(.tint)
               Text("Hello, world!")
           }
       } detail: {
           Text("Select an Article")
       }
    }
}

#Preview {
    ContentView()
}
