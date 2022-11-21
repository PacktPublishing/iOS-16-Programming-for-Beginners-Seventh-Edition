//
//  RatingsView.swift
//  LetsEat
//
//  Created by iOS16Programming on 29/09/2022.
//

import UIKit

class RatingsView: UIControl {
    
    private let filledStarImage = UIImage(named: "filled-star")
    private let halfStarImage = UIImage(named: "half-star")
    private let emptyStarImage = UIImage(named: "empty-star")
    private var totalStars = 5
    var rating = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.systemBackground.cgColor)
        context!.fill(rect)
        let ratingsViewWidth = rect.size.width
        let availableWidthForStar = ratingsViewWidth / Double(totalStars)
        let starSidelength = (availableWidthForStar <= rect.size.height) ? availableWidthForStar : rect.size.height
        for index in 0..<totalStars {
            let starOriginX = (availableWidthForStar * Double(index)) + ((availableWidthForStar - starSidelength) / 2)
            let starOriginY = ((rect.size.height - starSidelength) / 2)
            let frame = CGRect(x: starOriginX, y: starOriginY, width: starSidelength, height: starSidelength)
            var starToDraw: UIImage!
            if (Double(index + 1) <= self.rating) {
                starToDraw = filledStarImage
            } else if (Double(index + 1) <= self.rating.rounded()) {
                starToDraw = halfStarImage
            } else {
                starToDraw = emptyStarImage
            }
            starToDraw.draw(in: frame)
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        true
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        guard self.isEnabled else {
            return false
        }
        super.beginTracking(touch, with: event)
        handle(with: touch)
        return true
    }

}

private extension RatingsView {
    
    func handle(with touch: UITouch) {
        let starRectWidth = self.bounds.size.width / Double(totalStars)
        let location = touch.location(in: self)
        var value = location.x / starRectWidth
        if (value + 0.5) < value.rounded(.up) {
            value = floor(value) + 0.5
        } else {
            value = value.rounded(.up)
        }
        updateRating(with: value)
    }
    
    func updateRating(with newValue: Double) {
        if (self.rating != newValue && newValue >= 0 && newValue <= Double(totalStars)) {
            self.rating = newValue
        }
    }
}
