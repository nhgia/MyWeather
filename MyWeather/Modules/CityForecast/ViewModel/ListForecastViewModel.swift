//
//  ListForecastViewModel.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
final class ListForecastViewModel: NSObject {
    private let networkRequest = NetworkRequest<ListForecastModel>()
    fileprivate var listForecastModel: ListForecastModel?
    
    //MARK:- Initialization
    override init() {
        super.init()
    }
    
    func fetchListForecast(from cityName: String) {
        let endpoint = NetworkEndpoints.listWeather(citySearchName: cityName, unit: .celsius)
        networkRequest.request(endpoint: endpoint) { [weak self] responseObject, errorObject in
            if let responseObject = responseObject {
                self?.listForecastModel = responseObject
            }
            else {
                
            }
        }
    }
}
