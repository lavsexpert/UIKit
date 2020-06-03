//
//  ViewController.swift
//  UIWebView
//
//  Created by Sergey Lavrov on 03.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

  @IBOutlet weak var webView: WKWebView!
  @IBOutlet weak var backItem: UIBarButtonItem!
  @IBOutlet weak var forwardItem: UIBarButtonItem!
  @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
  
  let application = UIApplication.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    webView.navigationDelegate = self
    webView.scalesLargeContentImage = true
    if let url = URL(string: "https://www.google.ru"){
      let request = URLRequest(url: url)
      print(url.port ?? "без порта", url.user ?? "неизвестный", url.scheme ?? "без схемы")
      webView.load(request)
    }
  }

  //MARK: - Method
  func isWorkIndicator(isAnimated: Bool, indicator: UIActivityIndicatorView){
    if #available(iOS 13.0, *) {
      // do nothing
    } else {
      application.isNetworkActivityIndicatorVisible = isAnimated
    }
    if isAnimated {
      loadIndicator.startAnimating()
      loadIndicator.isHidden = false
    } else {
      loadIndicator.stopAnimating()
      loadIndicator.isHidden = true
    }
  }

  //MARK: - UIWebViewDelegate
  
  // Аналог webViewDidStartLoad
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    isWorkIndicator(isAnimated: true, indicator: loadIndicator)
    backItem.isEnabled = false
    forwardItem.isEnabled = false
  }
  
  // Аналог webViewDidFinishLoad
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    isWorkIndicator(isAnimated: false, indicator: loadIndicator)
    if webView.canGoBack {
      backItem.isEnabled = true
    }
    if webView.canGoForward {
      forwardItem.isEnabled = true
    }
  }
  
  // Аналог webView shouldStartLoadWith
  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
    print("navigationAction.request = ", navigationAction.request)
    decisionHandler(.allow, .init())
    switch (navigationAction.navigationType) {
      case .linkActivated:
        webView.load(navigationAction.request)
        return
      default:
        break
    }
  }
  
  //MARK: - Action
  
  @IBAction func goBack(_ sender: Any) {
    if webView.canGoBack {
      webView.goBack()
    }
  }
  
  @IBAction func goForward(_ sender: Any) {
    if webView.canGoForward {
      webView.goForward()
    }
  }
  
  @IBAction func doRefresh(_ sender: Any) {
    webView.reload()
  }
  
  @IBAction func openPDF(_ sender: Any) {
    if let urlPdf = Bundle.main.url(forResource: "dummy", withExtension: "pdf"){
      let request = URLRequest(url: urlPdf)
      webView.load(request)
    }
  }
}

