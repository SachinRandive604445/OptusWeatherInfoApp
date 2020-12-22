//
//  OptusWeatherInfoAppTests.swift
//  OptusWeatherInfoAppTests
//
//  Created by Sachin on 22/12/20.
//  Copyright © 2020 Sachin. All rights reserved.
//

import XCTest
@testable import OptusWeatherInfoApp

class OptusWeatherInfoAppTests: XCTestCase {
   var testSession: URLSession!
    override func setUp() {
    testSession = URLSession(configuration: .default)
    }

    override func tearDown() {
        testSession = nil
        super.tearDown()
    }

    // Asynchronous test: success fast, failure slow
    func testValidCallToGetCityListStatusCode200() {
        let listOfCityInfo = DatabaseManager.sharedInstance.getCityInfoDataFromDB()
        let groupOfId = (listOfCityInfo.map{$0["id"] as! String}).joined(separator: ",")
        print(groupOfId)
        let urlString = OWAppConfig.BaseURL + OWAppConfig.group + "id=\(groupOfId)&units=\(OWConstants.UNIT)&APPID=\(OWAppConfig.API_KEY)"
        // given
        let url = URL(string: urlString)
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = testSession.dataTask(with: url!) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 10)
    }
    
}
