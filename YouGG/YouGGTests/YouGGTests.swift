//
//  YouGGTests.swift
//  YouGGTests
//
//  Created by Rohit Kumar on 02/05/21.
//

import XCTest
@testable import YouGG

class YouGGTests: XCTestCase {
    
    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        viewModel = HomeViewModel()
        viewModel.apiResource = HomeResourceMock()
        viewModel.getHomeInfo {
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetBrandsCountForSelectedCategory() throws {
        let count = viewModel.getBrandsCountForSelectedCategory()
        XCTAssertEqual(count, 2)

    }
    
    func testGetBrandModelForSelectedCategory() throws {
        let model = viewModel.getBrandModelForSelectedCategory(index: 0)
        XCTAssertEqual(model?.id, 643)

    }
    
    func testCurrentSelectedCategoryIndex() throws {
        let index = viewModel.currentSelectedCategoryIndex()
        XCTAssertEqual(index, 0)
    }
    
    func testGetCurrentSelectedCategoryModel() throws {
        let model = viewModel.getCurrentSelectedCategoryModel()
        XCTAssertEqual(model?.id, 32)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        viewModel = nil
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
