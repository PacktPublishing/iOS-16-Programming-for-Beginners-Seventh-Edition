//
//  RestaurantDetailViewController.swift
//  LetsEat
//
//  Created by iOS16Programming on 25/09/2022.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    var selectedRestaurant: RestaurantItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dump(selectedRestaurant as Any)
    }
}
