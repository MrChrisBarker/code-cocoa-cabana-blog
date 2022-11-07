//
//  Property_Wrappers_XCTMetricTests.swift
//  Property Wrappers XCTMetricTests
//
//  Created by Chris Barker on 07/11/2022.
//

import XCTest
@testable import Property_Wrappers_XCTMetric

// Base XCTestCase (not needed, for sample purposes only)
class XCTestCaseBase: XCTestCase {
    @propertyWrapper struct MeasureableObject<Type> {
        
        var wrappedValue = ""
        init(wrappedValue: Type, testInstance: XCTestCase) {
            
            testInstance.measure(metrics: [XCTClockMetric(),
                                           XCTCPUMetric(),
                                           XCTStorageMetric(),
                                           XCTMemoryMetric()]) {
                _ = wrappedValue
            }
        }
    }
}

// Main test class
final class Property_Wrappers_XCTMetricTests: XCTestCaseBase {

    func testPerformance_String() {
        @MeasureableObject<String>(testInstance: self)
        var test = "Test String"
        
    }
    
    func testPerformance_Function() {
        @MeasureableObject<Void>(testInstance: self)
        var test = TestTools().testLeak(cycles: 100000)
        
    }
    
    func testPerformance_viewController() {
        @MeasureableObject<UIViewController>(testInstance: self)
        var test = UIViewController()
    }

}

// Test Tools
class TestTools {
    
    func testLeak(cycles: Int) {
        for _ in (0...cycles) {
            let _ = DateFormatter()
        }
        
    }
    
}
