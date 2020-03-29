//
//  blogListViewController.swift
//  addBlog
//
//  Created by aietmac9 on 02/02/18.
//  Copyright © 2018 aietmac18. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class blogListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var ref: DatabaseReference!
    var blogs: [Blog] = []
    var blog: Blog = Blog(title: "",body: "")
    var key:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("/Blogs")
        ref?.observe(DataEventType.value,with:{(snapshot) in
            self.blogs.removeAll()
            for title in snapshot.children{
                let t = Blog(item: title as! DataSnapshot )
                self.blogs.append(t)
            }
            self.table.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.blogs.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! blogTableViewCell
        let blog = self.blogs[indexPath.row]
        cell.Title.text = blog.title
        return cell
    }
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! blogTableViewCell
            let selectedTitle = selectedCell.Title.text
        ref?.child("Blogs").queryOrdered(byChild: "Title").queryEqual(toValue: selectedTitle).observeSingleEvent(of: .value, with: { (snapshot) in
            if(snapshot.value is NSNull) {
                print("Does not exist!!")
            } else {
                for child in snapshot.children {
                    self.key = (child as AnyObject).key!!
                }
            }
        })
        
        self.performSegue(withIdentifier: "gotoEdit", sender: nil)
        }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as? UINavigationController
        let controller = navController?.viewControllers.first as? EditNoteViewController
        controller?.key=key
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navcontroller=segue.destination as? UINavigationController
        _=navcontroller?.viewControllers.first as? EditNoteViewController
    }
}

