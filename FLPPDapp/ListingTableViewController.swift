//
//  ListingTableViewController.swift
//  FLPPDapp
//
//  Created by New User on 11/30/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

  

  import UIKit
  import Firebase
  import FirebaseDatabase
  import FirebaseAuth
  
  class ListingTableViewController: UITableViewController {
    
    
    var dbRef:FIRDatabaseReference!
    var listings = [Listing]()
    
    var addedByUser = ""
    var content = ""
    
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      
      dbRef = FIRDatabase.database().reference().child("listing-items")
      startObservingDB()
    }
    
    func startObservingDB () {
      dbRef.observe(.value, with: {  (snapshot:FIRDataSnapshot) in
        var newListings = [Listing]()
        
        for listing in snapshot.children {
          let listingObject = Listing(snapshot: listing as! FIRDataSnapshot)
    
          newListings.append(listingObject)
        }
        
        self.listings = newListings
        self.tableView.reloadData()
        
        
        
      }) { (error: Error) in
        print(error)
        
      }
    }
    
    @IBAction func addListing(_ sender: AnyObject) {
      
      //remove this alert
      let listingAlert = UIAlertController(title: "New Listing", message: "Enter your Listing", preferredStyle: UIAlertControllerStyle.alert)
      listingAlert.addTextField { (textField : UITextField!)  in
        textField.placeholder = "Your Listing"
      }
      
      listingAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action:UIAlertAction) in
        if let listingContent = listingAlert.textFields?.first?.text {
          let listing : [String : Any] = [self.content: listingContent,  self.addedByUser: "Will Garner"]
          
          let listingRef = self.dbRef.child(listingContent.lowercased())
          
          listingRef.setValue(listing)
        }
        
      }))
      
      self.present(listingAlert, animated: true, completion: nil)
      
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return listings.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let listing = listings[indexPath.row]
      
      cell.textLabel?.text = listing.content
      cell.detailTextLabel?.text = listing.addedByUser
      
      return cell
      
      
      /* var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
      
      let label1 = cell?.viewWithTag(1) as! UILabel
      label1.text = posts[indexPath.row].title
      
      let label2 = cell?.viewWithTag(2) as! UILabel
      label2.text = posts[indexPath.row].message
      
      
      return cell!*/
    
    }
    
    
    
}
