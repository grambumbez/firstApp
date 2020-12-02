//
//  Article.swift
//  firstApp
//
//  Created by Айдар on 25.11.2020.
//

import Foundation

struct Article {
    var author: String
    var title: String
    var description: String
    var publishedAt: String
    var content: String
    
    init(dictionary: Dictionary<String, Any>) {
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        content = dictionary["content"] as? String ?? ""
    }
}
