//
//  CuestionarioViewController.swift
//  AlertaCOVID19
//
//  Created by David Ochoa on 02/04/20.
//  Copyright © 2020 David Ochoa. All rights reserved.
//

import UIKit
import WebKit
import Intercom

class CuestionarioViewController: UIViewController, WKUIDelegate, UIWebViewDelegate, WKNavigationDelegate{
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //var url :String = "";
    let url = URL(string: "SERVICE_URL");
    
    @IBOutlet weak var cuestionarioWebkit: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true

        // Do any additional setup after loading the view.
        cuestionarioWebkit.uiDelegate = self
        cuestionarioWebkit.navigationDelegate = self
        let requestObj = URLRequest(url: url! as URL)
        cuestionarioWebkit.load(requestObj)
        
        Intercom.setLauncherVisible(true)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
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
