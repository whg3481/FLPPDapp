//
//  ListingVC.swift
//  FLPPDapp
//
//  Created by New User on 11/30/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Listing {
  
  let key: String!
  let content: String!
  let addedByUser: String!
  let itemRef: FIRDatabaseReference?
  
  init(content: String, addedByUser:String, key:String = "") {
    self.key = key
    self.content = content
    self.addedByUser = addedByUser
    self.itemRef = nil
  }
  
  init (snapshot: FIRDataSnapshot) {
    key = snapshot.key
    itemRef = snapshot.ref
    
    if let listingContent = snapshot.value as? NSDictionary? {
      content = listingContent?[""] as? String
    } else {
      content = ""
   }
    
    if let user = snapshot.value as? NSDictionary? {
       addedByUser = user?[""] as? String
    } else {
      addedByUser = ""
    }
    
  }
  
}
