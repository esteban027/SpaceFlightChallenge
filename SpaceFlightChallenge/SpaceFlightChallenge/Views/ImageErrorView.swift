//
//  ImageErrorView.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 23/04/25.
//

import SwiftUI

struct ImageErrorView: View {
    var error: Error?
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "xmark.octagon.fill")
                .foregroundColor(.red)
            Text(error?.localizedDescription ?? "Image Not Found" )
            .multilineTextAlignment(.center)    }
    }
}

#Preview {
    ImageErrorView(error: nil)
}
