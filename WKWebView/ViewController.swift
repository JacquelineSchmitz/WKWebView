//
//  ViewController.swift
//  WKWebView
//
//  Created by Jacqueline Schmitz on 05.12.22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.apple.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        
        searchBar.text = url.absoluteString
        searchBar.delegate = self
        searchBar.autocorrectionType = .no
    }
    @IBAction func forwardPressed(_ sender: UIButton){
        webView.goForward()
    }
    @IBAction func backwardPressed(_ sender: UIButton){
        webView.goBack()
    }

}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.searchBar.text = webView.url?.absoluteString
    }
}
extension ViewController: UISearchBarDelegate{
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    let searchText = searchBar.text!
    searchBar.resignFirstResponder()
    let newURL = URL(string: "https://www.\(searchText).com")!
    webView.load(URLRequest(url: newURL))
    searchBar.text = newURL.absoluteString
  }
}
