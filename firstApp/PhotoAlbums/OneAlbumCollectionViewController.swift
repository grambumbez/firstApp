//
//  OneAlbumCollectionViewController.swift
//  firstApp
//
//  Created by Айдар on 29.11.2020.
//

import UIKit


class OneAlbumCollectionViewController: UICollectionViewController {
    
    var album: Albums!
    let spacing: CGFloat = 2
    let photoPerRow: CGFloat = 3
    
    let photoCat = catPhoto
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if album.nameAlbums == "Альбом собак" {
            return dogPhoto.count
        } else {
            return catPhoto.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoViewCell
        if album.nameAlbums == "Альбом собак" {
            let imageName = dogPhoto[indexPath.item]
            let image = UIImage(named: imageName)
            cell.dogImageView.image = image
        } else {
            let imageName = catPhoto[indexPath.item]
            let image2 = UIImage(named: imageName)
            cell.dogImageView.image = image2
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ZoomPhotoView") as! PhotoZoomView
        if album.nameAlbums == "Альбом собак" {
            vc.photo = dogPhoto
        } else {
            vc.photo = catPhoto
        }
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension OneAlbumCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = spacing * (photoPerRow + 1)
        let avaiLableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = avaiLableWidth/photoPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
}
