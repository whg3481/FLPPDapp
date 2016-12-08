//
//  User.swift
//  FLPPDapp
//
//  Created by New User on 12/1/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

struct User {
  let uid:String
  let email:String
  
  init(userData:FIRUser) {
    uid = userData.uid
    
    if let mail = userData.providerData.first?.email{
      email = mail
    }else{
      email = ""
    }
  }
  
  init(uid:String, email:String) {
    self.uid = uid
    self.email = email
    
  }
  
}
