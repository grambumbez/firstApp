//
//  NewsView.swift
//  firstApp
//
//  Created by Айдар on 30.12.2020.
//

import UIKit
import WebKit
import Alamofire

class NewsView: UIViewController, WKUIDelegate {

    var webView: WKWebView?
    var article: Article?
    
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView?.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let articleURL = article?.url else {return}
        if let postURL = URL(string: articleURL) {
            DispatchQueue.global(qos: .utility).async {
                AF.request(postURL).response {response in
                    if let web = response.request {
                        DispatchQueue.main.async {
                            self.webView?.load(web)
                        }
                    }
                }
            }
        }
    }
}
