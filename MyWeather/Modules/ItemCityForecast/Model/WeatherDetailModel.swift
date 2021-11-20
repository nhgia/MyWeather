//
//  WeatherDetailModel.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
struct WeatherDetailModel: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: WeatherDetailModel.CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.main = try values.decode(String.self, forKey: .main)
        self.description = try values.decode(String.self, forKey: .description)
        self.icon = try values.decode(String.self, forKey: .icon)
    }
}
