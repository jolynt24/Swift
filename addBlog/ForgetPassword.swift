//
//  ForgetPassword.swift
//  addBlog
//
//  Created by aietmac9 on 29/01/18.
//  Copyright © 2018 aietmac18. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgetPassword: UIViewController {
    
    @IBAction func CancelButton(_ sender: Any) {
          self.dismiss(animated: true, completion: nil)
    }

    @IBAction func ResetPassword(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: Text.text!)
        { (error) in
            if(error != nil) {
                print(error!.localizedDescription)
            }
            else {
                let controller = UIAlertController(title: "Reset Password",     message: "Email sent. Please check the email and reset password. ", preferredStyle: .alert)
                
                controller.addAction(UIAlertAction(title: "Go to Login", style: .default, handler: nil))
                self.present(controller, animated: true, completion: nil)
                
            }
        }
        

    }
    @IBOutlet weak var Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
