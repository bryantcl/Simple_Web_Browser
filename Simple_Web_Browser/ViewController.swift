//
//  ViewController.swift
//  Simple_Web_Browser
//
//  Created by CHRIS BRYANT on 2/16/20.
//  Copyright © 2020 CHRIS BRYANT. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIToolbarDelegate {
        var webView: WKWebView = WKWebView()
        let webPage = "https://www.perotmuseum.org"

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            loadLayout()
        }
        
        func loadLayout() {
            loadWebSite()

            navigationController?.navigationBar.barTintColor = .green
            navigationController?.navigationBar.tintColor = .white
            // set up the navigation buttons

            let webBackButton = UIBarButtonItem(title: "back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ViewController.backButtonTapped))
            let webRefreshButton = UIBarButtonItem(title: "reload", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ViewController.reloadButtonTapped))
            let webForwardButton = UIBarButtonItem(title: "forward", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ViewController.forwardButtonTapped))

            // group the navigation buttons together
             var barButtonItems = [UIBarButtonItem()]
            barButtonItems.append(webBackButton)
            barButtonItems.append(webRefreshButton)
            barButtonItems.append(webForwardButton)
        
            // add the buttons to the navigation bar
            self.navigationItem.setLeftBarButtonItems(barButtonItems, animated: true)
            // add the web view
            self.view.addSubview(webView)
            // constraints for web view
            webView.translatesAutoresizingMaskIntoConstraints = false
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            webView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            webView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            webView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        }
        
        func loadWebSite() {
            let url = URL(string: webPage)
            webView.load(URLRequest(url: url!))
        }

    // Button functions
        @IBAction func backButtonTapped() {
            if webView.canGoBack {
                webView.goBack()
            }
        }

        @IBAction func reloadButtonTapped() {
            webView.reload()
        }

        @IBAction func forwardButtonTapped() {
            if webView.canGoForward {
                webView.goForward()
            }
        }
    }
