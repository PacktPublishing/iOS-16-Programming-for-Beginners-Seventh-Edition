//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by iOS16Programming on 23/09/2022.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
