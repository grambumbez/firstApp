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
        photoZoomScroll.delegate = self
        photoZoomScroll.minimumZoomScale = photoZoomScroll.zoomScale
        photoZoomScroll.maximumZoomScale = 3.0
        photoZoomScroll.zoomScale = 1
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImage
    }
}
