//
//  OneAlbumCollectionViewController.swift
//  firstApp
//
//  Created by Айдар on 29.11.2020.
//

import UIKit


class OneAlbumCollectionViewController: UICollectionViewController {

    var album: Albums!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if album.nameAlbums == "Альбом собак" {
            return dogPhoto.count
        } else {
            return catPhoto.count
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoViewCell
        //cell.backgroundColor = .black
        if album.nameAlbums == "Альбом собак" {
            let imageName = dogPhoto[indexPath.item]
            let image = UIImage(named: imageName)
            cell.dogImageView.image = image
        } else {
            let imageCatName = catPhoto[indexPath.item]
            let image2 = UIImage(named: imageCatName)
            cell.dogImageView.image = image2
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPhoto" {
            let cell = sender as! PhotoViewCell
            (segue.destination as! OnePhotoViewController).oneImage = cell.dogImageView.image
        }
    }
    
}
extension OneAlbumCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photoPerRow: CGFloat = 2
        let paddingWidth = 20 * (photoPerRow + 1)
        let avaiLableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = avaiLableWidth/photoPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
