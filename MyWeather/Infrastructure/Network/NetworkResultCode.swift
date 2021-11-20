//
//  NetworkResultCode.swift
//  MyWeather
//
//  Created by Gia Nguyen on 21/11/2021.
//

import Foundation
enum NetworkResultCode: String {
    case cityNotFound = "404"
    case success = "200"
    case other
    
    init(code: String) {
        if let type = NetworkResultCode(rawValue: code) {
            self = type
        } else {
            self = .other
        }
    }
}
