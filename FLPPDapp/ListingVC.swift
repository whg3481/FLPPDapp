//
//  FLPPDapp
//
//  Created by New User on 12/1/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Listing {
  
  let key: String!
  let content: String!
  let addedByUser: String!
  let address: String!
  let itemRef: FIRDatabaseReference?
  
  init(content: String, addedByUser:String, key:String = "", address: String) {
    self.key = key
    self.content = content
    self.address = address
    self.addedByUser = addedByUser
    self.itemRef = nil
  }
  
  init (snapshot: FIRDataSnapshot) {
    key = snapshot.key
    itemRef = snapshot.ref
    
    let snapshotValue = snapshot.value as! [String:AnyObject]
    content = snapshotValue["content"] as! String
    addedByUser = snapshotValue["addedByUser"] as! String
    address = snapshotValue["address"] as! String
    
  }
  func toAnyObject() -> Any {
    return ["content":content, "addedByUser": addedByUser]
  }
}
