//
//  ViewController.swift
//  FLPPDapp
//
//  Created by New User on 11/27/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//



import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


let posts : [String : AnyObject] = ["title" : title as AnyObject, "message" : message as AnyObject]


let title = "title"
let message = "message"

struct postStructure  {
  let title : String!
  let message : String!
}

class TableViewController: UITableViewController {
  
  
  var posts = [postStructure]()
  
  //additions
  var ref: FIRDatabaseReference!
  var refHandle: UInt!
  //var listProperty = [AddNewListingViewController]()
  //  @IBOutlet weak var tableView: UITableView!
  
  let cellID = "cell"
  //end of new additions
  
  @IBAction func newListing(_ sender: AnyObject) {
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    tableView.delegate = self
    tableView.dataSource = self
    //This posts to Firebase
    let databaseRef = FIRDatabase.database().reference()
    
    databaseRef.child("Posts").queryOrderedByKey().observe(.childAdded, with: {
      (snapshot: FIRDataSnapshot) in
      
      let snapshotValue = snapshot.value as? NSDictionary
      let title = snapshotValue?["title"] as? String
      let message = snapshotValue?["message"] as? String
      
      self.posts.insert(postStructure(title: title,message: message ), at: 0)
      self.tableView.reloadData()
      
      
    
    })
  
  
post()
  
  }

  
  func post()  {
    
    let title = "Title"
    let message = "Message"
    
    let post : [String : AnyObject] = ["title" : title as AnyObject, "message" : message as AnyObject]
    
    let databaseRef =  FIRDatabase.database().reference()
    
    databaseRef.child("Posts").childByAutoId().setValue(post)
    
  }
  
  
  
  
  // This is the Function for the TableView that displays my sections
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return posts.count
  // This is original code that works from posting dummy post
    
return posts.count
  }

/*  func fetchListings()
  {
    refHandle = ref.child("Listing").observe(.childAdded, with: ()
  }*/

  
  
  //This is the function that displays the Text that will go in the Cell of my tableview on the main listing screen where listings from ALL users //will be displayed. I need to adjust this to consume the information from the actual AddNewListingVC
  override func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    
    let label1 = cell?.viewWithTag(1) as! UILabel
    label1.text = posts[indexPath.row].title
    
    let label2 = cell?.viewWithTag(2) as! UILabel
    label2.text = posts[indexPath.row].message
    
    
    return cell!
  }
  
  
  
  
  //The End of my code
}


