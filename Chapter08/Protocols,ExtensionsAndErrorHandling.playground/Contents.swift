import UIKit

protocol CalorieCount {
    var calories: Int { get }
    func description() -> String
}

class Burger: CalorieCount {
    let calories = 800
    func description() -> String {
        return "This burger has \(calories) calories"
    }
}

struct Fries: CalorieCount {
    let calories = 500
    func description() -> String {
        return "These fries have \(calories) calories"
    }
}

enum Sauce {
    case chili
    case tomato
}

extension Sauce: CalorieCount {
    var calories: Int {
        switch self {
        case .chili:
            return 20
        case .tomato:
            return 15
        }
    }
    func description() -> String {
        return "This sauce has \(calories) calories"
    }
}

let burger = Burger()
let fries = Fries()
let sauce = Sauce.tomato
let foodArray: [CalorieCount] = [burger, fries, sauce]

var totalCalories = 0
for food in foodArray {
    totalCalories += food.calories
}
print(totalCalories)

enum WebsiteError: Error {
    case noInternetConnection
    case siteDown
    case wrongURL
}

func checkWebsite(siteUp: Bool) throws -> String {
    if siteUp == false {
        throw WebsiteError.siteDown
    }
    return "Site is up"
}

let siteStatus = false
do {
    print(try checkWebsite(siteUp: siteStatus))
} catch {
   print(error)
}
