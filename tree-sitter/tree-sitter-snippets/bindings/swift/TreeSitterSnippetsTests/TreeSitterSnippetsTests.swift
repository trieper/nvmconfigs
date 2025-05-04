import XCTest
import SwiftTreeSitter
import TreeSitterSnippets

final class TreeSitterSnippetsTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_snippets())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Snippets grammar")
    }
}
