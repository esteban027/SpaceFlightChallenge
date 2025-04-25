//
//  EmptyView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 25/04/25.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
            
            Text( "No Articles found" )
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    EmptyView()
}
