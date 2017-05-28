//
//  DequeueTests.swift
//  SwiftDataStructures
//
//  Created by Chris Martin on 5/28/17.
//
//

import XCTest
@testable import SwiftDataStructures

class DequeueTests: XCTestCase {
    
    var dequeue: Dequeue<Int> = []
    
    override func setUp() {
        super.setUp()
        
        dequeue = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        XCTAssertEqual(dequeue.first?.value, 0)
        XCTAssertEqual(dequeue.last?.value, 9)
        XCTAssertEqual(dequeue.count, 10)
    }
    
    func testLinkedListInitializeable() {
        let array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let linkedList = LinkedList(array: array)
        dequeue = Dequeue(list: linkedList)
        
        XCTAssertEqual(dequeue.arrayValue, array)
    }
    
    func testPushBack() {
        dequeue.pushBack(item: 0)
        
        XCTAssertEqual(dequeue.last?.value, 0)
        XCTAssertEqual(dequeue.count, 11)
        
        dequeue.removeAll()
        dequeue.pushBack(item: 0)
        XCTAssertEqual(dequeue.count, 1)
        XCTAssertEqual(dequeue.last?.value, 0)
        XCTAssertEqual(dequeue.first?.value, 0)
    }
    
    func testPushFront() {
        dequeue.pushFront(item: 9)
        
        XCTAssertEqual(dequeue.first?.value, 9)
        XCTAssertEqual(dequeue.count, 11)
        
        dequeue.removeAll()
        dequeue.pushFront(item: 0)
        XCTAssertEqual(dequeue.count, 1)
        XCTAssertEqual(dequeue.last?.value, 0)
        XCTAssertEqual(dequeue.first?.value, 0)
    }
    
    func testPopBack() {
        XCTAssertEqual(dequeue.popBack(), 9)
        XCTAssertEqual(dequeue.count, 9)
        
        dequeue.removeAll()
        XCTAssertNil(dequeue.popBack())
    }
    
    func testPopFront() {
        XCTAssertEqual(dequeue.popFront(), 0)
        XCTAssertEqual(dequeue.count, 9)
        
        dequeue.removeAll()
        XCTAssertNil(dequeue.popFront())
    }
    
    func testArrayValue() {
        XCTAssertEqual(dequeue.arrayValue, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    }
    
    func testRemoveAll() {
        weak var firstNode = dequeue.first
        XCTAssertNotNil(firstNode)
        
        weak var lastNode = dequeue.last
        XCTAssertNotNil(lastNode)
        
        dequeue.removeAll()
        
        XCTAssertEqual(dequeue.count, 0)
        XCTAssertNil(firstNode)
        XCTAssertNil(lastNode)
    }
    
    func testCount() {
        XCTAssertEqual(dequeue.count, 10)
        
        dequeue.popBack()
        XCTAssertEqual(dequeue.count, 9)
        
        dequeue.popFront()
        XCTAssertEqual(dequeue.count, 8)
        
        dequeue.pushBack(item: 13)
        XCTAssertEqual(dequeue.count, 9)
        
        dequeue.removeAll()
        XCTAssertEqual(dequeue.count, 0)
        
        dequeue.pushBack(item: 10)
        XCTAssertEqual(dequeue.count, 1)
        
        dequeue.pushFront(item: 15)
        XCTAssertEqual(dequeue.count, 2)
        
        XCTAssertFalse(dequeue.isEmpty)
        
        dequeue.removeAll()
        XCTAssertEqual(dequeue.count, 0)
        XCTAssertTrue(dequeue.isEmpty)
    }
    
    func testDescription() {
        XCTAssertEqual(dequeue.description, dequeue.arrayValue.description)
        
        dequeue.removeAll()
        XCTAssertEqual(dequeue.description, dequeue.arrayValue.description)
    }
    
    static var allTests = [
        ("testLinkedListInitializeable", testLinkedListInitializeable),
        ("testPushBack", testPushBack),
        ("testPushFront", testPushFront),
        ("testPopFront", testPopFront),
        ("testPopBack", testPopBack),
        ("testArrayValue", testArrayValue),
        ("testRemoveAll", testRemoveAll),
        ("testCount", testCount),
        ("testDescription", testDescription),
    ]
}

