//
//  OnePhotoViewController.swift
//  firstApp
//
//  Created by Айдар on 30.11.2020.
//

import UIKit

class OnePhotoViewController: UIViewController {

    @IBOutlet weak var photoImage: UIImageView!
    var oneImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImage.image = oneImage
    }
}
