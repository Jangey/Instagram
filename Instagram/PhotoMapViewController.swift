//
//  PhotoMapViewController.swift
//  Instagram
//
//  Created by Jangey Lu on 9/22/18.
//  Copyright © 2018 Jangey Lu. All rights reserved.
//

import UIKit

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelPress(_ sender: Any) {
        let homeFeedPage = self.storyboard?.instantiateViewController(withIdentifier: "HomeFeedViewController") as! HomeFeedViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = homeFeedPage
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
