//
//  NetworkManagerTests.swift
//  NetworkManagerTests
//
//  Created by Denis Denisov on 31/8/24.
//

import XCTest
@testable import ToDoList

final class NetworkManagerTests: XCTestCase {

    var sut: NetworkManager!
    
    override func setUp() {
        super.setUp()
        sut = NetworkManager.shared
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFetchDataShouldReturnTasksWhenSuccess() throws {
        let expectation = expectation(
            description: "Fetch data should succeed and return tasks"
        )
        
        var tasks: [Task] = []
        
        sut.fetchData { result in
            switch result {
            case .success(let fetchTasks):
                tasks = fetchTasks
            case .failure(let error):
                XCTFail(
                    "Expected success, but got failure with error: \(error)"
                )
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("Timeout waiting for fetch data: \(error)")
            }
        }
        
        XCTAssert(
            !tasks.isEmpty,
            "Expected tasks to be non-empty on success"
        )
    }
}
