//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by Zelux on 2018. 05. 09..
//  Copyright © 2018. Zelux. All rights reserved.
//

import XCTest
@testable import NYTimes

class NYTimesDashboardTests: XCTestCase {
    
    var dashboardInteractor: DashboardInteractor!
    let dashboardVC = DashboardViewController()
    let communicationService = MockCommunicationService()
    
    override func setUp() {
        super.setUp()
        
        DashboardConfigurator.configureDashboardScreen(viewController: dashboardVC)
        dashboardInteractor = dashboardVC.interactor as! DashboardInteractor
        dashboardInteractor.communicationService = communicationService
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmptyResponse() {
        communicationService.result = FetchMostViewedResult()
        dashboardInteractor.fetchNextBlock(with: 20)
        XCTAssert(dashboardVC.configurations.isEmpty)
    }
    
    func testResultCount1() {
        let result = FetchMostViewedResult()
        result.results = [Results]()
        result.results?.append(Results())
        communicationService.result = result
        
        dashboardInteractor.fetchNextBlock(with: 20)
        XCTAssertEqual(dashboardVC.configurations.count, 1)
    }
    
    func testResultCount20() {
        let result = FetchMostViewedResult()
        result.results = [Results]()
        for _ in 0..<20 {
            result.results?.append(Results())
        }
        
        communicationService.result = result
        
        dashboardInteractor.fetchNextBlock(with: 20)
        XCTAssertEqual(dashboardVC.configurations.count, 20)
    }
    
    func testFetchTwice() {
        let result = FetchMostViewedResult()
        result.results = [Results]()
        for _ in 0..<20 {
            result.results?.append(Results())
        }
        communicationService.result = result
        
        dashboardInteractor.fetchNextBlock(with: 20)
        dashboardInteractor.fetchNextBlock(with: 20)
        XCTAssertEqual(dashboardVC.configurations.count, 40)
    }
    
    func testArticleTitle() {
        let result = FetchMostViewedResult()
        result.results = [Results]()
        let article = Results()
        article.title = "title"
        result.results?.append(article)
        
        
        communicationService.result = result
        
        dashboardInteractor.fetchNextBlock(with: 20)
        XCTAssertEqual(dashboardVC.configurations[0].title, "title")
    }
    
    func testArticleWriter() {
        let result = FetchMostViewedResult()
        result.results = [Results]()
        let article = Results()
        article.byline = "by xy"
        result.results?.append(article)
        
        
        communicationService.result = result
        
        dashboardInteractor.fetchNextBlock(with: 20)
        XCTAssertEqual(dashboardVC.configurations[0].writer, "by xy")
    }
    
    func testArticleDate() {
        let result = FetchMostViewedResult()
        result.results = [Results]()
        let article = Results()
        article.published_date = "2017-04-13"
        result.results?.append(article)
        
        
        communicationService.result = result
        
        dashboardInteractor.fetchNextBlock(with: 20)
        XCTAssertEqual(dashboardVC.configurations[0].date, "2017-04-13")
    }
    
    func testArticleImageUrl() {
        let result = FetchMostViewedResult()
        result.results = [Results]()
        let article = Results()
        let media = Media()
        let mediaMetadata = MediaMetadata()
        mediaMetadata.url = "urlstring"
        media.mediaMetadata = [mediaMetadata]
        article.media = [media]
        result.results?.append(article)
        communicationService.result = result
        
        dashboardInteractor.fetchNextBlock(with: 20)
        XCTAssertEqual(dashboardVC.configurations[0].imageUrl!, "urlstring")
    }
        
    func testArticleArticleUrl() {
        let result = FetchMostViewedResult()
        result.results = [Results]()
        let article = Results()
        article.url = "articleUrl"
        result.results?.append(article)
        
        
        communicationService.result = result
        
        dashboardInteractor.fetchNextBlock(with: 20)
        XCTAssertEqual(dashboardVC.configurations[0].articleUrl, "articleUrl")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
