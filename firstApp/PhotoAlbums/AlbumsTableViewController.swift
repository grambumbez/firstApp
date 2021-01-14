//
//  AlbumsTableViewController.swift
//  firstApp
//
//  Created by Айдар on 27.11.2020.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
    
    let array = [Albums(imgAlbum: catPhoto.first ?? "🐱", nameAlbums: "Альбом кошек"), Albums(imgAlbum: dogPhoto.first ?? "🐶", nameAlbums: "Альбом собак")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumsCell", for: indexPath) as! AlbumsTableViewCell
        let obj = array[indexPath.row]
        cell.nameAlbumLabel.text = obj.nameAlbums
        cell.photoAlbumImg.image = UIImage(named: obj.imgAlbum)
        cell.photoAlbumImg.layer.cornerRadius = 7
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToAlbum", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAlbum" {
            (segue.destination as? OneAlbumCollectionViewController)?.album = array[tableView.indexPathForSelectedRow!.row]
        }
    }
}
