//
//  DetailView.swift
//  App
//
//

import SwiftUI

struct DetailView: View {
    var forecastItem: ForecastItem
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Spacer()
                    Image(uiImage: forecastItem.type)
                    Text("Day \(forecastItem.day)")
                    Spacer()
                }
                Text(forecastItem.description)
            }
            .padding()
            Text("Sunrise: \(secondsToHoursMinutes(forecastItem.sunrise))")
            Text("Sunset:  \(secondsToHoursMinutes(forecastItem.sunset))")
            Text(String(format: "Chance of rain: %.0f%%", forecastItem.chanceRain * 100))
            Text("\(forecastItem.high)°C - highest temperature")
            Text("\(forecastItem.low)°C - lowest temperature")
            Spacer()
        }
        .padding()
    }
    
    func secondsToHoursMinutes(_ seconds: Int) -> String {
        return "\(seconds / 3600):\(seconds % 3600 / 60)"
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(forecastItem: ForecastItem(day: "1", description: "Sunny", sunrise: 27420, sunset: 63600, chanceRain: 0.1, high: 15, low: 6, type: "sunny"))
    }
}
