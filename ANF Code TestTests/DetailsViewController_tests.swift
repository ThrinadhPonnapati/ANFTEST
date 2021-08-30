//
//  DetailsViewController_tests.swift
//  ANF Code TestTests
//
//  Created by Thrinadh Ponnapati on 8/29/21.
//

import XCTest
@testable import ANF_Code_Test

class DetailsViewController_tests: XCTestCase {
    var testInstance: DetailsViewController!
    var viewModel = ANFExploreCardViewModel(view: ANFExploreCardTableViewController())
    
    override func setUp() {
        testInstance = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "DetailsViewController")
        viewModel = ANFExploreCardViewModel(view: ANFExploreCardTableViewController())
        viewModel.getDataFromLocalJSON()
    }
    
    func testData(){
        testInstance.exploreDataModel = viewModel.data[0]
        testInstance.loadView()
        testInstance.viewDidLoad()
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
