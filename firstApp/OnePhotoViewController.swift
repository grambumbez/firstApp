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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
