//
//  HomeFeedViewController.swift
//  Instagram
//
//  Created by Jangey Lu on 9/21/18.
//  Copyright © 2018 Jangey Lu. All rights reserved.
//

import UIKit
import Parse

class HomeFeedViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        homeTableView.rowHeight = 180
        //homeTableView.dataSource = self
    }
    
    @IBAction func onLogout(_ sender: Any) {
        
        // set user is logout
        PFUser.logOut()
        print("Loged out Success!")
        
        let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = signInPage
 
    }
    

}
