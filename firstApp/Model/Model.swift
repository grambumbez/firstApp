//
//  Model.swift
//  firstApp
//
//  Created by Айдар on 20.11.2020.
//

import Foundation

var articles: [Article] = []

func loadNews(completionHandler: (()-> Void)?) {
    guard let url = URL(string: "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fb85741bd56f49a59a1bea3d174959ff") else {return}
    print(url)
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url) { (urlFile, responce, error) in
        if urlFile != nil {
            let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) [0]+"/data.json"
            let urlPath = URL(fileURLWithPath: path)
            try? FileManager.default.copyItem(at: urlFile!, to: urlPath)
            print(urlPath)
            parsePosts()
            completionHandler?()
        }
    }
    downloadTask.resume()
}

func parsePosts() {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true) [0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    
    guard let data = try? Data(contentsOf: urlPath) else {return}
    guard let rootDictionary = try? (JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any>) else {return}
    guard let array = rootDictionary["articles"] as? [Dictionary<String, Any>] else {return}
    var returnArray: [Article] = []
    
    for dict in array {
        let newArticle = Article(dictionary: dict)
        returnArray.append(newArticle)
    }
    articles = returnArray
}

struct Albums {
    var imgAlbum: String
    var nameAlbums: String
}

let dogPhoto: Array = ["dog1","dog2","dog3","dog4","dog5","dog6","dog7","dog8"]
let catPhoto: Array = ["cat1","cat2","cat3","cat4","cat5","cat6"]

