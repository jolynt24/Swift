//
//  LogIn.swift
//  addBlog
//
//  Created by aietmac9 on 29/01/18.
//  Copyright © 2018 aietmac18. All rights reserved.
//

import UIKit
import FirebaseAuth



class LogIn: UIViewController {
    @IBOutlet weak var UserField: UITextField!
    @IBAction func LoginButton(_ sender: Any) {
        let user  = UserField.text
        let pass = PassField.text
        Auth.auth().signIn(withEmail: user!, password: pass!) { (user, error) in
            if error != nil {
                print("Login Failed")
                self.showAlert(title: "Error", detail: (error!.localizedDescription))
            }
            else {
                self.performSegue(withIdentifier: "GoToHomePage", sender: nil)
            }
        }
    }
    
   

    
    func showAlert(title:String,detail:String){
        let alertController = UIAlertController(title: title, message: detail, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil )
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var PassField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Login1.jpg")!)
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
