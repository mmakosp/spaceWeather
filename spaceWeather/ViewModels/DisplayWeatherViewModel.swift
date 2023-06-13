//
//  DisplayWeatherViewModel.swift
//  spaceWeather
//
//  Created by Mmako Sekhosana on 2023/06/12.
//

import Foundation
import UIKit

class DisplayWeatherViewModel {
    var model: WeatherModel
    let degreeSymbol = "\u{00B0}"
    
    // MARK: - Init
    init(with model: WeatherModel) {
        self.model = model
    }
    
    func futureCastCellModel() -> [FutureCastCellModel] {
        var cellModels: [FutureCastCellModel] = []
            
        for forecast in model.forecasts {
            let cellModel = FutureCastCellModel(futureCastDate: getDateString(dateString: forecast.date),
                                                temperature: "Temp \(forecast.temp.toString()) \(degreeSymbol)",
                                                humidity: "Humidity \(forecast.humidity.toString())",
                                                speed: "Wind \(forecast.windSpeed.toString())",
                                                icon: getIcon(safe: forecast.safe))
                cellModels.append(cellModel)
            }
            
            return cellModels
    }
    
    private func getIcon(safe: Bool) -> UIImage {
        if safe {
           return UIImage(named: "sunny") ?? UIImage()
        }
        return UIImage(named: "hot") ?? UIImage()
    }
    
    func getDateString(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = dateFormatter.date(from: dateString) {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMM dd"
                //..weekdayFormatter.dateFormat = "EEEE"
            
            let weekdayString = formatter.string(from: date)
            
            return weekdayString
        } else {
            return "Invalid date"
        }
    }
}

extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
}

extension Int {
    func toString() -> String
    {
        let myString = String(self)
        return myString
    }
}
