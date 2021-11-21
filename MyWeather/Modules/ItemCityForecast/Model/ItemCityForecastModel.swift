//
//  ItemCityForecastModel.swift
//  MyWeather
//
//  Created by Gia Nguyen on 17/11/2021.
//

import Foundation
struct ItemCityForecastModel: Decodable, Identifiable {
    let id = UUID()
    
    var dateTime: Date
    var sunriseTime: UInt64
    var sunsetTime: UInt64
    var temp: TempDayModel
    var humidity: Int
    var pressure: Int64
    var weatherDetails: [WeatherDetailModel]
    
    enum CodingKeys: String, CodingKey {
        case dateTime = "dt"
        case sunriseTime = "sunrise"
        case sunsetTime = "sunset"
        case temp = "temp"
        case humidity = "humidity"
        case pressure = "pressure"
        case weatherDetails = "weather"
        case timezone = "timezone"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ItemCityForecastModel.CodingKeys.self)
        let timeStamp = try values.decode(Double.self, forKey: .dateTime)
        self.dateTime = Date(timeIntervalSince1970: timeStamp)
        self.sunriseTime = try values.decode(UInt64.self, forKey: .sunriseTime)
        self.sunsetTime = try values.decode(UInt64.self, forKey: .sunsetTime)
        self.humidity = try values.decode(Int.self, forKey: .humidity)
        self.pressure = try values.decode(Int64.self, forKey: .pressure)
        self.temp = try values.decode(TempDayModel.self, forKey: .temp)
        
        self.weatherDetails = try values.decode(Array<WeatherDetailModel>.self, forKey: .weatherDetails)
    }
    
    //for debugging purpose only
    init() {
        self.dateTime = Date(timeIntervalSince1970: 1637380800)
        self.sunriseTime = 1637362270
        self.sunsetTime = 1637362270
        self.humidity = 88
        self.pressure = 1000
        self.temp = TempDayModel()
        
        self.weatherDetails = [WeatherDetailModel()]
    }
    
}
