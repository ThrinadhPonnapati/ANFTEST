//
//  ANF_Code_TestTests.swift
//  ANF Code TestTests
//


import XCTest
@testable import ANF_Code_Test

class ANFExploreCardTableViewControllerTests: XCTestCase {
    var testInstance: ANFExploreCardTableViewController!
    var viewModel = ANFExploreCardViewModel(view: ANFExploreCardTableViewController())
    
    override func setUp() {
        testInstance = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "ANFExploreCardTableViewController")
        viewModel = ANFExploreCardViewModel(view: ANFExploreCardTableViewController())
        viewModel.getDataFromLocalJSON()
    }

    func test_numberOfSections_ShouldBeOne() {
        let numberOfSections = testInstance.numberOfSections(in: testInstance.tableView)
        XCTAssert(numberOfSections == 1, "table view should have 1 section")
    }
    
    
    func test_cellForRowAtIndexPath_titleText_shouldNotBeBlank() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentTableViewCell
        let title = firstCell.nameLabel1.text
        XCTAssert(title?.count ?? 0 > 0, "title should not be blank")
    }
    
    func test_cellForRowAtIndexPath_ImageViewImage_shouldNotBeNil() {
        
        let firstCell =  testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ExploreContentTableViewCell
        
        XCTAssert(firstCell.imageView1?.image != nil, "image view image should not be nil")
    }
}
