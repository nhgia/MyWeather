//
//  ListForecastViewModel.swift
//  MyWeather
//
//  Created by Gia Nguyen on 20/11/2021.
//

import Foundation
final class ListForecastViewModel: ObservableObject {
    //MARK: - Attributes
    private let networkRequest = NetworkRequest<ListForecastModel>()
    
    @Published var listForecastModel: ListForecastModel?
    @Published var searchText = ""
    @Published var showCancelButton: Bool = false
    @Published var showingAlert = false
    @Published var isLoading = false
    
    fileprivate(set) var alertMessage: String = ""
    let currentUnit:UnitType = .celsius
    let numberOfDays: Int = 7
    
    typealias CallBack = () -> Void
    
    var bindingDataChanged: CallBack?
    
    //MARK: - Initialization
    
    //MARK: - Methods
    func fetchListForecast() {
        isLoading = true
        let endpoint = NetworkEndpoints.listWeather(citySearchName: searchText, unit: currentUnit, numberOfDays: numberOfDays)
        networkRequest.request(endpoint: endpoint) { [weak self] responseObject, statusResult in
            self?.isLoading = false
            if let responseObject = responseObject, let statusResult = statusResult, statusResult.responseCode == NetworkResultCode.success.rawValue {
                self?.listForecastModel = responseObject
            }
            else {
                self?.alertMessage = statusResult?.message ?? "Unknown error"
                self?.showingAlert = true
                self?.listForecastModel = nil
            }
        }
    }
    
    func onTextFldEditingChanged(isEditing: Bool) {
        showCancelButton = true
    }
    
    func onActionClearTextFld() {
        searchText = ""
    }
    
    func onActionCancelButton() {
        showCancelButton = false
    }
    
    func getListDaysForecast() -> [ItemCityForecastModel] {
        if let model = listForecastModel {
            return model.listDays
        }
        else {
            return []
        }
    }
    
    func getItemForecastView(from item: ItemCityForecastModel) -> ItemCityForecastView {
        ItemCityForecastView(forecastModel: item, timeZone: listForecastModel?.timeZone ?? 0, currentUnit: currentUnit)
    }
}
