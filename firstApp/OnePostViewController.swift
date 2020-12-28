//
//  OnePostViewController.swift
//  firstApp
//
//  Created by Айдар on 25.11.2020.
//

import UIKit

class OnePostViewController: UIViewController {
    
    var article: Article!
    
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var buttonAuthor: UIButton!
    var oneImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textTitle.text = article.title
        textDescription.text = article.description
        buttonAuthor.setTitle(article.author, for: .normal)
        self.navigationController?.setNavigationBarHidden(false, animated: false)        
        DispatchQueue.main.async {
            if let urlImage = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: urlImage) {
                    self.imagePost.image = UIImage(data: data)
                }
            }
        }
    }
    
    @IBAction func buttonActionAuthor(_ sender: Any) {
        guard let authorVC = storyboard?.instantiateViewController(identifier: "AuthorViewController") else {return}
        navigationController?.pushViewController(authorVC, animated: true)
    }
}
