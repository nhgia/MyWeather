//
//  ListForecastVMUnitTests.swift
//  MyWeatherTests
//
//  Created by Gia Nguyen on 21/11/2021.
//

import XCTest
@testable import MyWeather

class ListForecastVMUnitTests: XCTestCase {
    
    var viewModel: ListForecastViewModel!
    var listForecastNetworkRequest: NetworkRequest<ListForecastModel>!
    
    override func setUp() {
        listForecastNetworkRequest = NetworkRequest<ListForecastModel>()
        viewModel = .init(networkRequest: listForecastNetworkRequest)
    }
    
    func test_IsValidateListForecastViewModel() {
        let expectation = expectation(description: "Validate ListForecast viewModel")
        viewModel.searchText = "Saigon"
        viewModel.numberOfDays = 7
        viewModel.fetchListForecast { isSuccess in
            if isSuccess {
                XCTAssertNotNil(self.viewModel.listForecastModel)
                XCTAssertFalse(self.viewModel.isLoading)
                XCTAssertTrue(self.viewModel.listForecastModel?.listDays.count == self.viewModel.numberOfDays)
            }
            else {
                XCTAssertFalse(self.viewModel.isLoading)
                XCTAssertTrue(self.viewModel.showingAlert)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
}
