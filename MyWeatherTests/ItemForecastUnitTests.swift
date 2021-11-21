//
//  ItemForecastUnitTests.swift
//  MyWeatherTests
//
//  Created by Gia Nguyen on 21/11/2021.
//

import XCTest
@testable import MyWeather
class ItemForecastUnitTests: XCTestCase {

    var viewModel: ItemCityForecastViewModel!
    
    override func setUp() {
        viewModel = .init(forecastModel: ItemCityForecastModel(), timeZone: 25200, currentUnit: .celsius)
    }
    
    func test_IsValidateItemForecastViewModel() {
        XCTAssertNotNil(URL(string: viewModel.icon))
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "'Date:' E, dd MMM yyyy"
        XCTAssertNotNil(dateFormatterGet.date(from: viewModel.date))
    }

}
