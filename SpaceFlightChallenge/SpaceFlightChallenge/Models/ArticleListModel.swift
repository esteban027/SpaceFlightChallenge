//
//  ArticleListModel.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 24/04/25.
//

import Foundation

struct ArticleListModel: Decodable {
    let next: String
    let previous: String
    let results: [ArticleModel]
}
