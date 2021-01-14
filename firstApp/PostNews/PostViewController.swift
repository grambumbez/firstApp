//
//  PostViewController.swift
//  firstApp
//
//  Created by Айдар on 11.11.2020.
//

import UIKit

class PostViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsResponse?.articles.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        let article = newsResponse?.articles[indexPath.row]
        cell.nameLabel.text = article?.title
        cell.authorLabel.text = article?.author
        if let test = URL(string: article?.urlToImage ?? "No Photo") {
            DispatchQueue.global(qos: .utility).async {
                if let data = try? Data(contentsOf: test) {
                    DispatchQueue.main.async {
                        let img = UIImage(data: data)
                        cell.postImageView.image = img
                        cell.postImageView.layer.cornerRadius = 5
                    }
                }
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToOnePost", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOnePost"{
            (segue.destination as? NewsView)?.article = newsResponse?.articles[tableView.indexPathForSelectedRow!.row]
        }
    }
}
