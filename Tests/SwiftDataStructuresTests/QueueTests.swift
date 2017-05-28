//
//  QueueTests.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import XCTest
@testable import SwiftDataStructures

class QueueTests: XCTestCase {
    
    var queue: Queue<Int> = []
    
    override func setUp() {
        super.setUp()
        
        queue = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        XCTAssertEqual(queue.first?.value, 0)
        XCTAssertEqual(queue.last?.value, 9)
        XCTAssertEqual(queue.count, 10)
    }
    
    func testLinkedListInitializeable() {
        let array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let linkedList = LinkedList(array: array)
        queue = Queue(list: linkedList)
        
        XCTAssertEqual(queue.arrayValue, array)
    }
    
    func testPushBack() {
        queue.pushBack(item: 0)
        
        XCTAssertEqual(queue.last?.value, 0)
        XCTAssertEqual(queue.count, 11)
        
        queue.removeAll()
        queue.pushBack(item: 0)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.last?.value, 0)
        XCTAssertEqual(queue.first?.value, 0)
    }
    
    func testPopFront() {
        XCTAssertEqual(queue.popFront(), 0)
        XCTAssertEqual(queue.count, 9)
        
        queue.removeAll()
        XCTAssertNil(queue.popFront())
    }
    
    func testArrayValue() {
        XCTAssertEqual(queue.arrayValue, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    }
    
    func testRemoveAll() {
        weak var firstNode = queue.first
        XCTAssertNotNil(firstNode)
        
        weak var lastNode = queue.last
        XCTAssertNotNil(lastNode)
        
        queue.removeAll()
        
        XCTAssertEqual(queue.count, 0)
        XCTAssertNil(firstNode)
        XCTAssertNil(lastNode)
    }
    
    func testCount() {
        XCTAssertEqual(queue.count, 10)
        
        queue.popFront()
        XCTAssertEqual(queue.count, 9)
        
        queue.pushBack(item: 13)
        XCTAssertEqual(queue.count, 10)
        
        queue.removeAll()
        XCTAssertEqual(queue.count, 0)
        XCTAssertTrue(queue.isEmpty)
        
        queue.pushBack(item: 10)
        XCTAssertEqual(queue.count, 1)
        
        XCTAssertFalse(queue.isEmpty)
        
    }
    
    func testDescription() {
        XCTAssertEqual(queue.description, queue.arrayValue.description)
        
        queue.removeAll()
        XCTAssertEqual(queue.description, queue.arrayValue.description)
    }
    
    static var allTests = [
        ("testLinkedListInitializeable", testLinkedListInitializeable),
        ("testPushBack", testPushBack),
        ("testPopFront", testPopFront),
        ("testArrayValue", testArrayValue),
        ("testRemoveAll", testRemoveAll),
        ("testCount", testCount),
        ("testDescription", testDescription),
    ]
}

