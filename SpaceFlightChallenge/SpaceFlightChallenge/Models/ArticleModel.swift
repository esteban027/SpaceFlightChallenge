//
//  Article.swift
//  SpaceFlightChallenge
//
//  Created by Daniel esteban Bermudez valenzuela on 24/04/25.
//

import Foundation

struct ArticleModel: Decodable {
    let id: Int
    let title: String
    let authors: [AuthorModel]
    let imageURL: String
    let url: String
    let summary: String
    let publishedAt: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, title, authors, url, summary
            case imageURL = "image_url"
            case publishedAt = "published_at"
        }
}
