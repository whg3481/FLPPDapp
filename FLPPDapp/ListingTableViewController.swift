//
//  ListingTableViewController.swift
//  FLPPDapp
//
//  Created by New User on 11/30/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

  

  import UIKit
  import FirebaseDatabase
  import FirebaseAuth
  
  class SweetsTableViewController: UITableViewController {
    
    
    var dbRef:FIRDatabaseReference!
    var sweets = [Sweet]()
    
    var addedByUser = ""
    var content = ""
    
    
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      
      dbRef = FIRDatabase.database().reference().child("sweet-items")
      startObservingDB()
    }
    
    func startObservingDB () {
      dbRef.observe(.value, with: {  (snapshot:FIRDataSnapshot) in
        var newSweets = [Sweet]()
        
        for sweet in snapshot.children {
          let sweetObject = Sweet(snapshot: sweet as! FIRDataSnapshot)
          newSweets.append(sweetObject)
        }
        
        self.sweets = newSweets
        self.tableView.reloadData()
        
        
        
      }) { (error: Error) in
        print(error)
        
      }
    }
    
    @IBAction func addSweet(_ sender: AnyObject) {
      
      
      let sweetAlert = UIAlertController(title: "New Sweet", message: "Enter your Sweet", preferredStyle: UIAlertControllerStyle.alert)
      sweetAlert.addTextField { (textField : UITextField!)  in
        textField.placeholder = "Your Sweet"
      }
      
      sweetAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action:UIAlertAction) in
        if let sweetContent = sweetAlert.textFields?.first?.text {
          let sweet : [String : Any] = [self.content: sweetContent,  self.addedByUser: "Will Garner"]
          
          let sweetRef = self.dbRef.child(sweetContent.lowercased())
          
          sweetRef.setValue(sweet)
        }
        
      }))
      
      self.present(sweetAlert, animated: true, completion: nil)
      
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return sweets.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
      let sweet = sweets[indexPath.row]
      
      cell.textLabel?.text = sweet.content
      cell.detailTextLabel?.text = sweet.addedByUser
      
      return cell
    }
    
    
    
}
