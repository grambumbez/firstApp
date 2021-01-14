//
//  Article.swift
//  firstApp
//
//  Created by Айдар on 25.11.2020.
//

import Foundation

class NewsApi: Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}
class Article: Codable {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case author = "author"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
}

