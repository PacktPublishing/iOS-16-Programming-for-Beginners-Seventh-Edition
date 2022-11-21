//
//  ContentView.swift
//  LetsEatSwiftUI
//
//  Created by iOS16Programming on 08/10/2022.
//

import SwiftUI

struct ContentView: View {
    var restaurantItems: [RestaurantItem] = testData
    var body: some View {
        NavigationStack {
            List(restaurantItems) { restaurantItem in
                RestaurantCell(restaurantItem: restaurantItem)
            }.navigationTitle("Boston, MA")
                .navigationDestination(for: RestaurantItem.self) {
                    restaurantItem in RestaurantDetail(selectedRestaurant: restaurantItem)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(restaurantItems: testData)
    }
}

struct RestaurantCell: View {
    var restaurantItem: RestaurantItem
    var body: some View {
        NavigationLink(value: restaurantItem) {
            VStack {
                Text(restaurantItem.title)
                    .font(.headline)
                    .fixedSize()
                Text(restaurantItem.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize()
                AsyncImage(url: URL(string: restaurantItem.imageURLString))
                    .mask(RoundedRectangle(cornerRadius: 9))
            }
        }
    }
}
