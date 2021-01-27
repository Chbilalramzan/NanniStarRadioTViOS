//
//  WebViewController.swift
//  NanniStarRadioTV
//
//  Created by Bilal Ramzan on 05/04/2019.
//  Copyright © 2019 Bilal Ramzan. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {


    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mkWebView: WKWebView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = CustomColors(withFrame: view.frame).getBackgroundColor()
            // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if CheckConnection.Connection() {
            self.newsView()
        }
        else{
            activityIndicator.stopAnimating()
            self.Alert(Message: "Your device is Not Connected with Internet")
            
        }
        
    }

    @IBAction func onButtonBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func Alert(Message: String) {
        
        let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertController.Style.alert )
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func newsView() {
        
        let urlString:String = "https://www.facebook.com/nannistarRadio/"
        mkWebView.navigationDelegate = self
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        mkWebView.load(urlRequest)
        
    }
    
    func webViewDidStartLoad(_ : WKWebView){
        activityIndicator.startAnimating()
    }
    
    func webView(_ : WKWebView, didFinish navigation: WKNavigation! ){
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
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
