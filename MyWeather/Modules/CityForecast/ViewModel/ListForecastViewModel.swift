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
    
    typealias CallBack = () -> Void
    
    var bindingDataChanged: CallBack?
    
    //MARK: - Initialization
    init() {
    }
    
    //MARK: - Methods
    func onTextFldDoneEdit() {
        let endpoint = NetworkEndpoints.listWeather(citySearchName: searchText, unit: .celsius)
        networkRequest.request(endpoint: endpoint) { [weak self] responseObject, errorObject in
            if let responseObject = responseObject {
                self?.listForecastModel = responseObject
            }
            else {
                
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
        viewModel.showCancelButton = false
    }
}
