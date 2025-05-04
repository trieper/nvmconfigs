import XCTest
import SwiftTreeSitter
import TreeSitterPaketref

final class TreeSitterPaketrefTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_paketref())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Paketref grammar")
    }
}
