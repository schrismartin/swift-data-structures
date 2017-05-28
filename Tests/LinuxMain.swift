import XCTest
@testable import SwiftDataStructuresTests

XCTMain([
    testCase(LinkedListTests.allTests),
    testCase(DequeueTests.allTests),
    testCase(QueueTests.allTests)
])
