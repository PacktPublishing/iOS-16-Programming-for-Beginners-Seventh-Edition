//
//  ViewController.swift
//  BreakfastMaker
//
//  Created by iOS 15 Programming on 24/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var toastLabel: UILabel!
    @IBOutlet var eggLabel: UILabel!
    @IBOutlet var sandwichLabel: UILabel!
    @IBOutlet var elapsedTimeLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let startTime = Date().timeIntervalSince1970
        toastLabel.text = "Making toast..."
        toastLabel.text = makeToast()
        eggLabel.text = "Poaching eggs..."
        eggLabel.text = poachEgg()
        sandwichLabel.text = makeSandwich()
        let endTime = Date().timeIntervalSince1970
        elapsedTimeLabel.text = "Elapsed time is \(((endTime - startTime) * 100).rounded() / 100) seconds"
    }
    
    func makeToast() -> String {
        sleep(2)
        return "Toast done"
    }
    
    func poachEgg() -> String {
        sleep(6)
        return "Egg done"
    }
    
    func makeSandwich() -> String {
        return "Sandwich done"
    }
    
    @IBAction func testButton(_ sender: UIButton) {
        print("Button tapped")
    }
    
}

