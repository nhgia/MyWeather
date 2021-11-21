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
        // Check if icon is a valid URL
        XCTAssertNotNil(URL(string: viewModel.icon))
        
        // Check if date display string is a valid date
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "'Date:' E, dd MMM yyyy"
        XCTAssertNotNil(dateFormatterGet.date(from: viewModel.date))
    }

}
