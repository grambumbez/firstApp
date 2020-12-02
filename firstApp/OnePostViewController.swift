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
    @IBOutlet weak var textTitle: UITextView!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var buttonAuthor: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textTitle.text = article.title
        textDescription.text = article.description
        buttonAuthor.setTitle(article.author, for: .normal)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func buttonActionAuthor(_ sender: Any) {
        guard let authorVC = storyboard?.instantiateViewController(identifier: "AuthorViewController") else {return}
        navigationController?.pushViewController(authorVC, animated: true)
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
