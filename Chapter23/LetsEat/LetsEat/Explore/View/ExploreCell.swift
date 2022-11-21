//
//  ExploreCell.swift
//  LetsEat
//
//  Created by iOS16Programming on 23/09/2022.
//

import UIKit

class ExploreCell: UICollectionViewCell {
    
    @IBOutlet var exploreNameLabel: UILabel!
    @IBOutlet var exploreImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        exploreImageView.layer.cornerRadius = 9
        exploreImageView.layer.masksToBounds = true
    }
    
}
