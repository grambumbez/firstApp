//
//  PhotoZoomView.swift
//  firstApp
//
//  Created by Айдар on 12.01.2021.
//

import UIKit

class PhotoZoomView: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var photo: Array<String>?
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "PhotoZoomCell", bundle: nil), forCellWithReuseIdentifier: identifire)
        
        collectionView.performBatchUpdates(nil) { (result) in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
        }
        
    }
}

extension PhotoZoomView: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! PhotoZoomCell
        guard let imageName = photo?[indexPath.item] else { return cell }
        let image = UIImage(named: imageName)
        cell.photoImage.image = image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let width = frameCV.width / countCells
        let height = width
        return CGSize(width: width, height: height)
    }
    
    
}
