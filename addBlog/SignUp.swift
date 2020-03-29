//
//  SignUp.swift
//  addBlog
//
//  Created by aietmac9 on 29/01/18.
//  Copyright © 2018 aietmac18. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUp: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "signup.jpeg")!)
    }

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var ContactInfoField: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    
    @IBAction func SignUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: Username.text!, password: Password.text!) { (user, error) in
            if error != nil {
                self.showAlert(title: "Error", detail: (error!.localizedDescription))
            }
            else {
                self.showAlert(title: "Success", detail: "SignUp successfully done")
            }
        }

    }
    
    func showAlert(title:String,detail:String){
        let alertController = UIAlertController(title: title, message: detail, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil )
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
