//
//  HomeFeedViewController.swift
//  Instagram
//
//  Created by Jangey Lu on 9/21/18.
//  Copyright © 2018 Jangey Lu. All rights reserved.
//

import UIKit
import Parse

class HomeFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
 
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [PFObject] = []
    
    var refreshControl:UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 180
        //homeTableView.rowHeight = 180
        tableView.dataSource = self
        tableView.delegate = self
    */
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControl.Event.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        tableView.dataSource = self
        fetchPost()
 
    }
    
    @IBAction func tapNewPicture(_ sender: Any) {
        let newPostPage = self.storyboard?.instantiateViewController(withIdentifier: "PhotoMapViewController")
            //as! PhotoMapViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = newPostPage
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        
        // set user is logout
        PFUser.logOut()
        print("Loged out Success!")
        
        let signInPage = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = signInPage
 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! HomeTableViewCell
        cell.instagramPost = posts[indexPath.row]
        return cell
    }
 
    
    func fetchPost(){
        let query = Post.query()
        query?.order(byDescending: "createdAt")
        query?.includeKey("author")
        query?.limit = 20
        
        query?.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let posts = posts {
                self.posts = posts
                
            }
            self.tableView.reloadData()
        }
        self.refreshControl.endRefreshing()
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl){
        fetchPost()
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let post = posts[indexPath.row]
            let detailViewController = segue.destination as! PostDetailViewController
            detailViewController.post = post
        }
        
    }
 
}
