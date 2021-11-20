//
//  ConfigKey.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
struct ConfigKey {
    fileprivate static func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
    
    static func getBackendBaseUrl() -> String? {
        return infoForKey("Backend Base URL")
    }
    
    static func getBackendBaseImageUrl() -> String {
        guard let stringValue = infoForKey("Backend Image URL") else {
            fatalError("Backend Image URL is nil, please double check")
        }
        return stringValue
    }
}
