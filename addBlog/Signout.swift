//
//  Signout.swift
//  addBlog
//
//  Created by aietmac9 on 29/01/18.
//  Copyright © 2018 aietmac18. All rights reserved.
//

import UIKit
import FirebaseAuth
class Signout: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Signout(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "logoutSegue", sender: self)
        }catch{
            print("Error while signing out!")
        }    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
