//
//  ErrorView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 24/04/25.
//

import SwiftUI

struct ErrorView: View {
    var error: Error?
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "xmark.octagon.fill")
                .foregroundColor(.red)
            Text(error?.localizedDescription ?? "Content Could Not Be Loaded" )
            .multilineTextAlignment(.center)    }
    }
}

#Preview {
    ErrorView(error: nil)
}
