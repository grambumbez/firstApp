//
//  PhotoZoomCell.swift
//  firstApp
//
//  Created by Айдар on 12.01.2021.
//

import UIKit

class PhotoZoomCell: UICollectionViewCell, UIScrollViewDelegate {


    @IBOutlet weak var photoZoomScroll: UIScrollView!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.photoZoomScroll.delegate = self
        self.photoZoomScroll.minimumZoomScale = 0.5
        self.photoZoomScroll.maximumZoomScale = 3.0
        self.photoZoomScroll.zoomScale = 1
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImage
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        photoZoomScroll.zoomScale = 1
    }

}
