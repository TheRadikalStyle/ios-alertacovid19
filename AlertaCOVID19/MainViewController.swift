//
//  MainViewController.swift
//  AlertaCOVID19
//
//  Created by David Ochoa on 02/04/20.
//  Copyright © 2020 David Ochoa. All rights reserved.
//

import UIKit
import Intercom

class MainViewController: UITabBarController {
    @IBOutlet weak var bottomTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //bottomTabBar.barTintColor = #colorLiteral(red: 0.3676702976, green: 0.2073790729, blue: 0.6933636665, alpha: 1) //Bar background color
        bottomTabBar.tintColor = #colorLiteral(red: 0.3676702976, green: 0.2073790729, blue: 0.6933636665, alpha: 1)
        
        if(bottomTabBar.frame.size.height > 0){
            ConfigureIntercom(height: Float(bottomTabBar.frame.size.height))
        }
    }
    
    
    
    
    
    func ConfigureIntercom(height :Float){
        Intercom.setLauncherVisible(true)
        Intercom.setBottomPadding(bottomTabBar.frame.size.height)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?s) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
