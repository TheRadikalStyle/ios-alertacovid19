//
//  ContactoViewController.swift
//  AlertaCOVID19
//
//  Created by David Ochoa on 03/04/20.
//  Copyright © 2020 David Ochoa. All rights reserved.
//

import UIKit
import Intercom

class ContactoViewController: UIViewController {
    @IBOutlet weak var viewCallContainer: RoundUIView!
    @IBOutlet weak var stackView_facebook: UIStackView!
    @IBOutlet weak var stackView_webpage: UIStackView!
    @IBOutlet weak var stackview_about: RoundUIView!
    var counter = 0
    var isEggAlreadyShow = false
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Intercom.setLauncherVisible(true)
        
        let gestureClickCall = UITapGestureRecognizer.init(target: self, action: #selector (self.call070 (_:)))
        viewCallContainer.addGestureRecognizer(gestureClickCall)
        
        let gestureClickFacebook = UITapGestureRecognizer.init(target: self, action: #selector(self.openFacebook(_:)))
        stackView_facebook.addGestureRecognizer(gestureClickFacebook)
        
        let gestureClickWebpage = UITapGestureRecognizer.init(target: self, action: #selector(self.openWebpage(_:)))
        stackView_webpage.addGestureRecognizer(gestureClickWebpage)
        
        let gestureClickVersion = UITapGestureRecognizer.init(target: self, action: #selector(self.openEasterEgg(_:)))
        stackview_about.addGestureRecognizer(gestureClickVersion)
    }
    
    
    
    @objc func call070(_ sender:UITapGestureRecognizer){
        if let url = URL(string: "tel://070"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc func openFacebook(_ sender:UITapGestureRecognizer){
        //https://www.facebook.com/SecretariaSaludNL
        if let url = URL(string: "fb://SecretariaSaludNL"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc func openWebpage(_ sender:UITapGestureRecognizer){
        if let url = URL(string: "http://saludnl.gob.mx"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @objc func openEasterEgg(_ sender:UITapGestureRecognizer){
        counter = counter + 1;
        if(counter >= 7){
            if(!isEggAlreadyShow){
                
                let date = Date()
                let calendar = Calendar.current
                let hour = calendar.component(.hour, from: date)
                let minute = calendar.component(.minute, from: date)
                
                if(hour == 3 && minute <= 58){
                    var controller = UIAlertController.init(title: "Dev by:",
                                                            message: "David Ochoa\nCopyright 2020\nMonterrey, Nuevo León, México",
                                                            preferredStyle: .alert)
                    var action = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
                        self.dismiss(animated: true) {
                            
                        }
                    }
                    
                    controller.addAction(action)
                    self.tabBarController?.present(controller, animated: true, completion: {})
                    
                    counter = 0
                    isEggAlreadyShow = true
                }else{
                    var controller = UIAlertController.init(title: "Hola",
                                                            message: "😀",
                                                            preferredStyle: .alert)
                    var action = UIAlertAction.init(title: "OK", style: .default) { (UIAlertAction) in
                        self.dismiss(animated: true) {
                            
                        }
                    }
                    
                    controller.addAction(action)
                    self.tabBarController?.present(controller, animated: true, completion: {})

                isEggAlreadyShow = true;
            }
            counter = 0;
            }
        }
    }
    
}
