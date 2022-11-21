//
//  ReviewItem.swift
//  LetsEat
//
//  Created by iOS16Programming on 30/09/2022.
//

import UIKit

struct ReviewItem {
    var date: Date?
    var rating: Double?
    var title: String?
    var name: String?
    var customerReview: String?
    var restaurantID: Int64?
    var uuid = UUID()
}

extension ReviewItem {
    init(review: Review) {
        self.date = review.date
        self.rating = review.rating
        self.title = review.title
        self.name = review.name
        self.customerReview = review.customerReview
        self.restaurantID = review.restaurantID
        if let reviewUUID = review.uuid {
            self.uuid = reviewUUID
        }
    }
}
