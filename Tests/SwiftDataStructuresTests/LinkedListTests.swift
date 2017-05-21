import XCTest
@testable import SwiftDataStructures

class LinkedListTests: XCTestCase {
    
    func testCount() {
        var list: LinkedList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
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
    }
    
    static var allTests = [
        ("testCount", testCount),
    ]
}
