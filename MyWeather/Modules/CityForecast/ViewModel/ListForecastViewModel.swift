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
    
    fileprivate(set) var alertMessage: String = ""
    let currentUnit:UnitType = .celsius
    
    typealias CallBack = () -> Void
    
    var bindingDataChanged: CallBack?
    
    //MARK: - Initialization
    
    //MARK: - Methods
    func onTextFldDoneEdit() {
        let endpoint = NetworkEndpoints.listWeather(citySearchName: searchText, unit: currentUnit)
        networkRequest.request(endpoint: endpoint) { [weak self] responseObject, errorObject in
            if let responseObject = responseObject {
                self?.listForecastModel = responseObject
            }
            else {
                self?.alertMessage = errorObject?.localizedDescription ?? "Unknow error occured."
                self?.showingAlert = true
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
}
