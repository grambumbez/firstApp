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
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray
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
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToOnePost", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOnePost"{
            (segue.destination as? OnePostViewController)?.article = newsResponse?.articles[tableView.indexPathForSelectedRow!.row]
        }
    }
}
