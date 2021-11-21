//
//  ListForecastWithRequestUnitTests.swift
//  MyWeatherTests
//
//  Created by Gia Nguyen on 21/11/2021.
//

import XCTest
@testable import MyWeather

class ListForecastWithRequestUnitTests: XCTestCase {
    
    var listForecastNetworkRequest: NetworkRequest<ListForecastModel> = .init()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_RequestListForecastValidateResponse() {
        let expectation = expectation(description: "Success response in less than 5 seconds")
        let numberOfDays:Int = 3
        let endpoint = NetworkEndpoints.listWeather(citySearchName: "Saigon", unit: .fahrenheit, numberOfDays: numberOfDays)
        listForecastNetworkRequest.request(endpoint: endpoint) { responseObject, resultCodeObject in
            // Every response have a valid result object which includes: cod, mess
            // Even the default value have this object, therefore it cannot be nil
            XCTAssertNotNil(resultCodeObject)
            
            // This is a valid request, so if the server successfully response, response object cannot be nil
            XCTAssertNotNil(responseObject)
            
            // Check cod = "200": success
            XCTAssertEqual(resultCodeObject?.responseCode, NetworkResultCode.success.rawValue)
            
            // Check total forecast days = 3 days
            XCTAssertEqual(responseObject?.listDays.count, numberOfDays)
            
            // Check timezone is valid
            if let responseObject = responseObject {
                XCTAssertNotNil(TimeZone(secondsFromGMT: responseObject.timeZone))
            }
            else {
                XCTAssertTrue(false)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_RequestListForecastErrorResponse() {
        let expectation = expectation(description: "Failure response in less than 5 seconds")
        let endpoint = NetworkEndpoints.listWeather(citySearchName: "sfghjaogharso", unit: .fahrenheit, numberOfDays: 7)
        listForecastNetworkRequest.request(endpoint: endpoint) { _, resultCodeObject in
            // Every response have a valid result object which includes: cod, mess
            // Even the default value have this object, therefore it cannot be nil
            XCTAssertNotNil(resultCodeObject)
            
            // Check cod != "200": everything but success
            XCTAssertNotEqual(resultCodeObject?.responseCode, NetworkResultCode.success.rawValue)
            
            // Message can be changed based on the requirement and how we want to dynamic show to users.
            // Therefore cannot compare to any specific string, just check nil.
            XCTAssertNotNil(resultCodeObject?.message)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_RequestListForecastNotTimeout() {
        let expectation = expectation(description: "Response in less than 5 seconds")
        let endpoint = NetworkEndpoints.listWeather(citySearchName: "Saigon", unit: .celsius, numberOfDays: 7)
        listForecastNetworkRequest.request(endpoint: endpoint) { _, resultCodeObject in
            XCTAssertNotNil(resultCodeObject)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

}
