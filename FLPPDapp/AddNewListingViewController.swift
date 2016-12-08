//
//  AddNewListingViewController.swift
//  FLPPDapp
//
//  Created by New User on 11/29/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

protocol AddListingViewControllerDelegate: class {
  // func addListingViewControllerDelegateDidAddListing(list: Property)
}


class AddNewListingViewController: UIViewController {

  var dbRef:FIRDatabaseReference!
  
    @IBOutlet weak var Address: UITextField!
  @IBOutlet weak var Zipcode: UITextField!
  @IBOutlet weak var State: UITextField!
  @IBOutlet weak var City: UITextField!
  @IBOutlet weak var ARV: UITextField!
  @IBOutlet weak var ListPrice: UITextField!
  @IBOutlet weak var PropertyDescription: UITextView!
  
  @IBAction func ListButton(_ sender: UIButton) {
    
    
    let property = ["title":"My House"]
    let propertyListing = self.dbRef.child("listing-items")
    propertyListing.setValue(property)
    
    
    
    self.dismiss(animated: true, completion: nil)
  }
  @IBAction func cancelListing(_ sender: AnyObject) {
    // This cancels the post without submitting it
    presentingViewController?.dismiss(animated: true, completion: nil)
  }
  
    override func viewDidLoad() {  
        super.viewDidLoad()

      
      
      
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
