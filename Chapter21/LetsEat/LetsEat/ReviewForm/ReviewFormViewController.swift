//
//  ReviewFormViewController.swift
//  LetsEat
//
//  Created by iOS16Programming on 29/09/2022.
//

import UIKit

class ReviewFormViewController: UITableViewController {
    
    @IBOutlet var ratingsView: RatingsView!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var reviewTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onSaveTapped(_ sender: Any) {
        print(ratingsView.rating)
        print(titleTextField.text as Any)
        print(nameTextField.text as Any)
        print(reviewTextView.text as Any)
        dismiss(animated: true, completion: nil)
    }
}
