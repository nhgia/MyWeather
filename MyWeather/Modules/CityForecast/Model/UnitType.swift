//
//  UnitType.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
enum UnitType:String {
    case kelvin = "default"
    case celsius = "metric"
    case fahrenheit = "imperial"
    
    init(type: String) {
        if let type = UnitType(rawValue: type) {
            self = type
        } else {
            self = .celsius
        }
    }
}
