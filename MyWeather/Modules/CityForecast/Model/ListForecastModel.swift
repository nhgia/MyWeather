//
//  ListForecastModel.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
struct ListForecastModel: Decodable {
    var listDays: [ItemCityForecastModel]
    var timeZone: TimeZone
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case listDays = "list"
        case city = "city"
    }
    
    enum CityCodingKeys: String, CodingKey {
        case timeZone = "timezone"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        print(decoder)
        let values = try decoder.container(keyedBy: ListForecastModel.CodingKeys.self)
        self.listDays = try values.decode(Array<ItemCityForecastModel>.self, forKey: .listDays)
        
        let cityNested = try values.nestedContainer(keyedBy: CityCodingKeys.self, forKey: .city)
        let timeZoneSec = try cityNested.decode(Int.self, forKey: .timeZone)
        self.timeZone = TimeZone(secondsFromGMT: timeZoneSec) ?? TimeZone.current
        self.name = try cityNested.decode(String.self, forKey: .name)
    }
    
}
