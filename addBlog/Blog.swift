//
//  Blog.swift
//  addBlog
//
//  Created by AIET on 27/01/18.
//  Copyright © 2018 aietmac18. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct Blog {
    
    var title:String
    var body:String
    var reference : DatabaseReference?
    var key : String?
    
     init(title:String,body:String) {
        self.title = title
        self.body = body
    }
    
    init(item: DataSnapshot) {
        let JsonValue = item.value as? [String:Any]
        self.title = JsonValue?["Title"] as! String
        self.body = JsonValue?["Body"] as! String
        self.reference = item.ref
        self.key = item.key
    }
    
    func tojson() -> [String:Any] {
        return ["Title":title,"Body":body]
    }
    
}
