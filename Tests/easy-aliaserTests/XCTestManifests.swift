import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(easy_aliaserTests.allTests),
    ]
}
#endif
