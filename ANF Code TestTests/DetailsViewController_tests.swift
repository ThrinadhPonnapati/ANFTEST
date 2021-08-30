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
        testInstance.exploreDataModel = viewModel.data[6]
        testRandomDataByLoadingView()
    }
    
    func testRandomDataByLoadingView(){
        testInstance.loadView()
        testInstance.viewDidLoad()
    }
    
    
    func test_numberOfSections_ShouldBeThree() {
        let numberOfSections = testInstance.numberOfSections(in: testInstance.tableView)
        XCTAssert(numberOfSections == 3, "table view should have 1 section")
    }
    
    func test_numberOfRowsSections_ShouldBeOne() {
        let numberOfSections = testInstance.tableView(testInstance.tableView, numberOfRowsInSection: 0)
        XCTAssert(numberOfSections == 1, "table view should have 1 row in  section 0")
    }
    
    /*"title": "ALL SHORTS $29",
    "backgroundImage": "anf-US-20160505-app-w-shorts.jpg",
    "content": [
      {
        "target": "https://www.abercrombie.com/shop/us/womens-shorts-bottoms",
        "title": "SHOP NOW"
      }
    ],
    "topDescription": "LIMITED TIME",*/
    func test_cellForRowAtIndexPath_imageCell() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! DetailImageTableViewCell
        firstCell.imageView1.image = nil
        firstCell.setCustomImage(image: UIImage.init(named: "anf-US-20160505-app-w-shorts")!)
        XCTAssert(firstCell.imageView?.image == nil, "test image cell")
    }
    
    func test_cellForRowAtIndexPath_desctiption_Cell() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 1)) as! DetailDescriptionTableViewCell
        let title = firstCell.titleLabel.text
        let description = firstCell.topDescriptionLabel.text
        XCTAssert(title == "ALL SHORTS $29", "test desc cell")
        XCTAssert(description == "LIMITED TIME","test desc cell")
    }
    
    func test_cellForRowAtIndexPath_button_Cell() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 2)) as! ButtonTableViewCell
        let title = firstCell.button.title(for: .normal)
        XCTAssert(title ==  "SHOP NOW", "test button cell")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
