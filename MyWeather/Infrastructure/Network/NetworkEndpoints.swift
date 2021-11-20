//
//  NetworkEndpoints.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
import Alamofire

struct NetworkEndpoints {
    static func listWeather(citySearchName: String, unit: UnitType) -> NetworkEndpoint {
        let queryParams: Parameters = [
            "q": citySearchName,
            "cnt": 7,
            "appid": Configs.backendId,
            "units": unit.rawValue
        ]
        return NetworkEndpoint(method: .get, path: "data/2.5/forecast/daily", isFullPath: false, queryParameters: queryParams)
    }
}
