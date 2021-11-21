//
//  ItemCityForecastViewModel.swift
//  MyWeather
//
//  Created by Gia Nguyen on 21/11/2021.
//

import Foundation
final class ItemCityForecastViewModel: ObservableObject {
    //MARK: - Attributes
    fileprivate var forecastModel: ItemCityForecastModel
    fileprivate var dateFormatter: DateFormatter
    fileprivate var currentUnit: UnitType
    
    @Published var date: String = .init()
    @Published var avgTemp: String = .init()
    @Published var pressure: String = .init()
    @Published var humid: String = .init()
    @Published var desc: String = .init()
    @Published var icon: String = .init()
    
    typealias CallBack = () -> Void
    
    var bindingDataChanged: CallBack?
    
    //MARK: - Computed properties
    fileprivate var dateString: String {
        return "Date: " + dateFormatter.string(from: forecastModel.dateTime)
    }
    
    fileprivate var avgTempString: String {
        let avgTemp: Double = averageOf(forecastModel.temp.day, forecastModel.temp.evening, forecastModel.temp.morning, forecastModel.temp.night)
        return "Average Temperature: \(Int(avgTemp))" + currentUnit.getStringRepresent()
    }
    
    fileprivate var pressureString: String {
        return "Pressure: \(forecastModel.pressure)"
    }
    
    fileprivate var humidString: String {
        return "Humidity: \(forecastModel.humidity)%"
    }
    
    fileprivate var descString: String {
        let desc = forecastModel.weatherDetails.first?.description ?? "N/A"
        return "Description: " + desc
    }
    
    fileprivate var iconString: String {
        forecastModel.weatherDetails.first?.icon ?? ""
    }
    
    //MARK: - Initialization
    init(forecastModel: ItemCityForecastModel, timeZone: Int, currentUnit: UnitType) {
        self.forecastModel = forecastModel
        self.dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy"
        dateFormatter.timeZone  = TimeZone(secondsFromGMT: timeZone) ?? TimeZone.current
        self.currentUnit = currentUnit
        
        self.date = dateString
        self.avgTemp = avgTempString
        self.pressure = pressureString
        self.humid = humidString
        self.desc = descString
        self.icon = iconString
    }
    
    //MARK: - Methods
    func averageOf(_ numbers: Double...) -> Double {
        let numberTotal = numbers.count
        if numberTotal == 0 {
            return 0
        }
        var sum:Double = 0

        for number in numbers {
            sum = sum + number
        }
        return sum/Double(numberTotal)
    }
}
