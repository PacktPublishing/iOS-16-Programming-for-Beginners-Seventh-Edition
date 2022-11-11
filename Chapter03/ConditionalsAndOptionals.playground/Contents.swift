import UIKit

let isRestaurantOpen = false
if isRestaurantOpen {
    print("Restaurant is open.")
}

let isRestaurantFound = true
if isRestaurantFound == false {
    print("Restaurant was not found")
}

let drinkingAgeLimit = 21
let customerAge = 19
if customerAge < drinkingAgeLimit {
    print("Under age limit")
} else {
    print("Over age limit")
}

var trafficLightColor = "Red"
if trafficLightColor == "Red" {
    print("Stop")
} else if trafficLightColor == "Yellow" {
    print("Caution")
} else if trafficLightColor == "Green" {
    print("Go")
} else {
    print("Invalid color")
}

trafficLightColor = "Yellow"
switch trafficLightColor {
case "Red":
    print("Stop")
case "Yellow":
    print("Caution")
case "Green":
    print("Go")
default:
    print("Invalid color")
}

var spouseName: String?
spouseName = nil
print(spouseName ?? "No value in spouseName")
if let spouseTempVar = spouseName {
    let greeting = "Hello, " + spouseTempVar
    print(greeting)
}

