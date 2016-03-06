//
//  ViewController.swift
//  PassportBoilerplate
//
//  Created by Attila Kis on 06/03/2016.
//  Copyright © 2016 Attila Kis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tfUsername.text = "testuser"
        tfPassword.text = "123456"
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func loginTapped(sender: AnyObject) {
        
        tvResult.text = ""
        
        guard let username = self.tfUsername.text else {
            self.tvResult.text = "Username is nil"
            return
        }
        
        guard let password = self.tfPassword.text else {
            self.tvResult.text = "Password is nil"
            return
        }
        
        NetworkManager.sharedManager.login(username, password: password) { (success, response) -> Void in
            self.tvResult.text = success ? "SUCCESS\n" : "FAILURE\n"
            self.tvResult.text! += response?.toJSONString() ?? ""
        }
    }
    
    @IBAction func logoutTapped(sender: AnyObject) {
        
        tvResult.text = ""
        
        NetworkManager.sharedManager.logout { (success, response) -> Void in
            self.tvResult.text = success ? "SUCCESS\n" : "FAILURE\n"
            self.tvResult.text! += response?.toJSONString() ?? ""
        }
    }
    
    @IBAction func registerTapped(sender: AnyObject) {
        
        tvResult.text = ""
        
        guard let username = self.tfUsername.text else {
            self.tvResult.text = "Username is nil"
            return
        }
        
        guard let password = self.tfPassword.text else {
            self.tvResult.text = "Password is nil"
            return
        }
        
        NetworkManager.sharedManager.register(username, password: password) { (success, response) -> Void in
            self.tvResult.text! += response?.toJSONString() ?? ""
        }
    }
    
    @IBAction func getDataTapped(sender: AnyObject) {
        
        tvResult.text = ""
        
        NetworkManager.sharedManager.getData { (success, response) -> Void in
            self.tvResult.text = success ? "SUCCESS\n" : "FAILURE\n"
            self.tvResult.text! += response?.toJSONString() ?? ""
        }
    }
}

