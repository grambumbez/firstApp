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

