//
//  MyWeatherApp.swift
//  MyWeather
//
//  Created by Gia Nguyen on 13/11/2021.
//

import SwiftUI

@main
struct MyWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            let networkRequest = NetworkRequest<ListForecastModel>()
            ListForecastView(networkReq: networkRequest)
        }
    }
}
