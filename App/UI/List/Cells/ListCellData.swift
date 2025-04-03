//
//  ListTableData.swift
//  App
//
//

import GlobalUI

class ListCellData: TableViewData {
    override var cellType: TableViewCell.Type? { ListCell.self }

    private var forecast: ForecastItem

    var title: String {
        "Day \(forecast.day) - \(forecast.description)"
    }

    init(forecast: ForecastItem) {
        self.forecast = forecast
        super.init()
    }

    override func hash(into hasher: inout Hasher) {
        hasher.combine("\(forecast.day)")
        hasher.combine("\(forecast.description)")
        hasher.combine("\(forecast.sunrise)")
        hasher.combine("\(forecast.sunset)")
        hasher.combine("\(forecast.chanceRain)")
        hasher.combine("\(forecast.high)")
        hasher.combine("\(forecast.low)")
        hasher.combine("\(forecast.type)")
    }

    override func isEqual(to other: TableViewData) -> Bool {
        guard let other = other as? ListCellData else { return false }
        return (
            self.forecast.day == other.forecast.day &&
            self.forecast.description == other.forecast.description &&
            self.forecast.sunrise == other.forecast.sunrise &&
            self.forecast.sunset == other.forecast.sunset &&
            self.forecast.chanceRain == other.forecast.chanceRain &&
            self.forecast.high == other.forecast.high &&
            self.forecast.low == other.forecast.low &&
            self.forecast.type == other.forecast.type
        )
    }
}
