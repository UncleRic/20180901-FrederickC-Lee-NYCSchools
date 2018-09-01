//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by Frederick C. Lee on 8/31/18.
//  Copyright © 2018 Amourine Technologies. All rights reserved.
// ----------------------------------------------------------------------------------

@testable import NYCSchools
import XCTest

class NYCSchoolsTests: XCTestCase {

    func testJSONParser() {
        let controller = MainViewController()

        let dataSource = """
        [{
        "dbn" : "01M292",
        "num_of_sat_test_takers" : "29",
        "sat_critical_reading_avg_score" : "355",
        "sat_math_avg_score" : "404",
        "sat_writing_avg_score" : "363",
        "school_name" : "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES"
        },
        {
        "dbn" : "79Q950",
        "num_of_sat_test_takers" : "8",
        "sat_critical_reading_avg_score" : "496",
        "sat_math_avg_score" : "400",
        "sat_writing_avg_score" : "426",
        "school_name" : "GED PLUS s CITYWIDE"
        },
        {
        "dbn" : "79X490",
        "num_of_sat_test_takers" : "9",
        "sat_critical_reading_avg_score" : "367",
        "sat_math_avg_score" : "370",
        "sat_writing_avg_score" : "360",
        "school_name" : "PHOENIX ACADEMY"
        }]
        """.data(using: .utf8)

        let result = controller.processData(data: dataSource)
        var expectedValue = 3
        XCTAssertEqual(result.count, expectedValue, "Data count should be \(expectedValue)")
        
        expectedValue = 9
        XCTAssertEqual(Int(result[2].numOfSatTestTakers), expectedValue, "Number of Test Takers should be \(expectedValue)")
        
    
    }

}
