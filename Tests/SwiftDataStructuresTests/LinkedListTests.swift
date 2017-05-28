import XCTest
@testable import SwiftDataStructures

class LinkedListTests: XCTestCase {
    
    var list: LinkedList<Int> = []
    
    override func setUp() {
        super.setUp()
        
        list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        XCTAssertEqual(list.first?.value, 0)
        XCTAssertEqual(list.last?.value, 9)
        XCTAssertEqual(list.count, 10)
    }
    
    func testAtIndex() {
        XCTAssertNil(list.node(at: -1))
        XCTAssertEqual(list.node(at: 0)?.value, 0)
        XCTAssertEqual(list.node(at: 4)?.value, 4)
        XCTAssertEqual(list.node(at: 9)?.value, 9)
        XCTAssertNil(list.node(at: 10))
        XCTAssertNil(list.node(at: 58906346))
    }
    
    func testInsert() {
        guard let node = list[5] else { XCTAssertFalse(false); return }
        
        list.insert(value: 500, after: node)
        XCTAssertEqual(list.count, 11)
        XCTAssertEqual(list[6]?.value, 500)
        
        list.insert(value: 600, before: node)
        XCTAssertEqual(list.count, 12)
        XCTAssertEqual(list[5]?.value, 600)
    }
    
    func testBeforeAfter() {
        guard let node = list[5] else { XCTAssertFalse(false); return }
        
        let next = list.node(after: node)
        XCTAssertEqual(next?.value, 6)
        
        let prev = list.node(before: node)
        XCTAssertEqual(prev?.value, 4)
    }
    
    func testPushBack() {
        list.pushBack(item: 0)
        
        XCTAssertEqual(list.last?.value, 0)
        XCTAssertEqual(list.count, 11)
        
        list.removeAll()
        list.pushBack(item: 0)
        XCTAssertEqual(list.count, 1)
        XCTAssertEqual(list.last?.value, 0)
        XCTAssertEqual(list.first?.value, 0)
    }
    
    func testPushFront() {
        list.pushFront(item: 9)
        
        XCTAssertEqual(list.first?.value, 9)
        XCTAssertEqual(list.count, 11)
        
        list.removeAll()
        list.pushFront(item: 0)
        XCTAssertEqual(list.count, 1)
        XCTAssertEqual(list.last?.value, 0)
        XCTAssertEqual(list.first?.value, 0)
    }
    
    func testPopBack() {
        XCTAssertEqual(list.popBack(), 9)
        XCTAssertEqual(list.count, 9)
        
        list.removeAll()
        XCTAssertNil(list.popBack())
    }
    
    func testPopFront() {
        XCTAssertEqual(list.popFront(), 0)
        XCTAssertEqual(list.count, 9)
        
        list.removeAll()
        XCTAssertNil(list.popFront())
    }
    
    func testArrayValue() {
        XCTAssertEqual(list.arrayValue, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
    }
    
    func testRemoveAll() {
        weak var firstNode = list.first
        XCTAssertNotNil(firstNode)
        
        weak var middleNode = list[4]
        XCTAssertNotNil(middleNode)
        
        weak var lastNode = list.last
        XCTAssertNotNil(lastNode)
        
        list.removeAll()
        
        XCTAssertEqual(list.count, 0)
        XCTAssertNil(firstNode)
        XCTAssertNil(middleNode)
        XCTAssertNil(lastNode)
    }
    
    func testRemove() {
        weak var node = list[5]
        XCTAssertNotNil(node)
        
        // Force unwrap node because we've asserted existance.
        let value = list.remove(node: node!)
        XCTAssertEqual(value, 5)
        
        XCTAssertNil(node)
        XCTAssertEqual(list.count, 9)
    }
    
    func testCount() {
        XCTAssertEqual(list.count, 10)
        
        list.popBack()
        XCTAssertEqual(list.count, 9)
        
        list.popFront()
        XCTAssertEqual(list.count, 8)
        
        list.pushBack(item: 13)
        XCTAssertEqual(list.count, 9)
        
        list.removeAll()
        XCTAssertEqual(list.count, 0)
        
        list.pushBack(item: 10)
        XCTAssertEqual(list.count, 1)
        
        let node = list.pushFront(item: 15)
        XCTAssertEqual(list.count, 2)
        
        list.remove(node: node)
        XCTAssertEqual(list.count, 1)
        
        XCTAssertFalse(list.isEmpty)
        
        list.removeAll()
        XCTAssertEqual(list.count, 0)
        XCTAssertTrue(list.isEmpty)
    }
    
    func testDescription() {
        XCTAssertEqual(list.description, list.arrayValue.description)
        
        list.removeAll()
        XCTAssertEqual(list.description, list.arrayValue.description)
    }
    
    static var allTests = [
        ("testAtIndex", testAtIndex),
        ("testInsert", testInsert),
        ("testBeforeAfter", testBeforeAfter),
        ("testPushBack", testPushBack),
        ("testPushFront", testPushFront),
        ("testPopBack", testPopBack),
        ("testPopFront", testPopFront),
        ("testArrayValue", testArrayValue),
        ("testRemoveAll", testRemoveAll),
        ("testRemove", testRemove),
        ("testCount", testCount),
        ("testDescription", testDescription)
    ]
}
