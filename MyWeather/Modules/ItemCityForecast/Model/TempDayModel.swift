//
//  TempDayModel.swift
//  MyWeather
//
//  Created by Gia Nguyen on 18/11/2021.
//

import Foundation
import Alamofire

struct TempDayModel: Decodable {
    var day: Double
    var min: Double
    var max: Double
    var night: Double
    var evening: Double
    var morning: Double
    
    enum CodingKeys: String, CodingKey {
        case day = "day"
        case min = "min"
        case max = "max"
        case night = "night"
        case evening = "eve"
        case morning = "morn"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: TempDayModel.CodingKeys.self)
        self.day = try values.decode(Double.self, forKey: .day)
        self.min = try values.decode(Double.self, forKey: .min)
        self.max = try values.decode(Double.self, forKey: .max)
        self.night = try values.decode(Double.self, forKey: .night)
        self.evening = try values.decode(Double.self, forKey: .evening)
        self.morning = try values.decode(Double.self, forKey: .morning)
    }
    
    //for debugging purpose only
    init() {
        self.day = 10.0
        self.min = 10.0
        self.max = 10.0
        self.night = 10.0
        self.evening = 10.0
        self.morning = 10.0
    }
    
}
