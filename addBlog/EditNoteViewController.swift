//
//  EditNoteViewController.swift
//  addBlog
//
//  Created by AIET on 27/01/18.
//  Copyright © 2018 aietmac18. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EditNoteViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editBody: UITextView!
    
    @IBAction func done(_ sender: Any) {
        ref = Database.database().reference()
        let title = self.editTitle.text
        let body = self.editBody.text
        let blogReference = ref.child("/Blogs").childByAutoId()
        let blogAdd = Blog(title: title!, body: body!)
        blogReference.setValue(blogAdd.tojson())
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "blog1.jpeg")!)
        editTitle.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func update(selectedTitle:String) {
    ref = Database.database().reference()
    let title = editTitle.text
    let body = editBody.text
    let blog = Blog(title: title!, body: body!)
    ref.child("/Blogs/\(selectedTitle)").removeValue()
    let childUpdates = ["/Blogs/\(selectedTitle)": blog.tojson()]
    ref.updateChildValues(childUpdates)
    }
    
}


