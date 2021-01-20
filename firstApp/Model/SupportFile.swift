//
//  SupportFile.swift
//  firstApp
//
//  Created by Айдар on 18.01.2021.
//

import Foundation
import UIKit

// MARK: - PostView data
// PostViewController.swift
let urlString = "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fb85741bd56f49a59a1bea3d174959ff"
// MARK: - PhotoAlbums data
// AlbumsTableViewController.swift
struct Albums {
    var imgAlbum: String
    var nameAlbums: String
}
let dogPhoto: Array = ["dog1","dog2","dog3","dog4","dog5","dog6","dog7","dog8"]
let catPhoto: Array = ["cat1","cat2","cat3","cat4","cat5","cat6", "cat7"]
let array = [Albums(imgAlbum: catPhoto.first ?? "🐱", nameAlbums: "Альбом кошек"), Albums(imgAlbum: dogPhoto.first ?? "🐶", nameAlbums: "Альбом собак")]
// OneAlbumCollectionViewController.swift
let spacing: CGFloat = 2
let photoPerRow: CGFloat = 3
let photoCat = catPhoto
// MARK: - PhotoZoom Data
//PhotoZoomView.swift
var countCells: CGFloat = 1
let identifire = "PhotoZoomCell"


