//
//  Model.swift
//  firstApp
//
//  Created by Айдар on 20.11.2020.
//

import Foundation
import Alamofire

var newsResponse: NewsApi?

func loadNews(completionHandler: (()-> Void)?) {
    let urlString = "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fb85741bd56f49a59a1bea3d174959ff"
    AF.request(urlString).response { response in
        guard let data = response.data else { return }
        parseArticle(data: data)
        completionHandler?()
    }
}
func parseArticle(data: Data) -> [Article] {
    do {
        newsResponse = try JSONDecoder().decode(NewsApi.self, from: data)
    } catch {
        print("Failed to decode JSON: \(error)")
        return []
    }
    return newsResponse?.articles ?? []
}

struct Albums {
    var imgAlbum: String
    var nameAlbums: String
}

let dogPhoto: Array = ["dog1","dog2","dog3","dog4","dog5","dog6","dog7","dog8"]
let catPhoto: Array = ["cat1","cat2","cat3","cat4","cat5","cat6"]

