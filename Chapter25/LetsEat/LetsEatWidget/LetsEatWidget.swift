//
//  LetsEatWidget.swift
//  LetsEatWidget
//
//  Created by iOS16Programming on 08/10/2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),
        restaurantTitle: "LetsEat",
        restaurantSubtitle: "")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),
        restaurantTitle: "LetsEat",
        restaurantSubtitle: "")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        var restaurantItems: [RestaurantItem] = []
        let manager = MapDataManager()
        manager.fetch {
            (annotations) in
            restaurantItems = annotations
        }
        for minuteOffset in 0 ..< restaurantItems.count {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset * 5, to: currentDate)!
            let entry = SimpleEntry(date: entryDate,
                                    restaurantTitle: restaurantItems[minuteOffset].title!,
                                    restaurantSubtitle: restaurantItems[minuteOffset].subtitle!)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let restaurantTitle: String
    let restaurantSubtitle: String
}

struct LetsEatWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                Text(entry.restaurantTitle)
                    .font(.headline)
                Text(entry.restaurantSubtitle)
                    .font(.body)
            }
        }
    }
}

@main
struct LetsEatWidget: Widget {
    let kind: String = "LetsEatWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            LetsEatWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("LetsEatWidget")
        .description("This widget shows you restaurants in your area")
        .supportedFamilies([.accessoryRectangular, .systemSmall])
    }
}

struct LetsEatWidget_Previews: PreviewProvider {
    static var previews: some View {
        LetsEatWidgetEntryView(entry: SimpleEntry(date: Date(),
                                                 restaurantTitle: "The Tap Trailhouse",
                                                 restaurantSubtitle: "Brewery, Burgers, American"))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
