//
//  ViewController.swift
//  Turnt
//
//  Created by Lauren Conniff on 2/6/16.
//  Copyright (c) 2016 Lauren Conniff. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if (FBSDKAccessToken.currentAccessToken() == nil){
            println("Not logged in..")
        }else
        {
            println("Logged in..")
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if error == nil
        {
            println("login complete")
            self.performSegueWithIdentifier("showNew", sender: self)
        }
        else
        {
            println(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User logged out..")
    }
    
    
    
    


}

