//
//  ListForecastModel.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
struct ListForecastModel: Decodable {
    var listDays: [ItemCityForecastModel]
    var timeZone: Int
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
        self.listDays = (try? values.decode(Array<ItemCityForecastModel>.self, forKey: .listDays)) ?? []
        
        if let cityNested = try? values.nestedContainer(keyedBy: CityCodingKeys.self, forKey: .city) {
            self.timeZone = (try? cityNested.decode(Int.self, forKey: .timeZone)) ?? 0
            self.name = (try? cityNested.decode(String.self, forKey: .name)) ?? ""
        }
        else {
            self.timeZone = 0
            self.name = ""
        }
    }
    
}
