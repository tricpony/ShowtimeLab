//
//  ShowtimeLabTests.swift
//  ShowtimeLabTests
//
//  Created by aarthur on 8/10/22.
//

import XCTest
@testable import ShowtimeLab

class ShowtimeLabTests: XCTestCase {
    var comic: Comic?
    let comicJSON = """
    {\"safe_title\":\"safe_title\", \
    \"alt\":\"alt\", \
    \"img\":\"img\", \
    }
    """

    override func setUpWithError() throws {
        let decoder = JSONDecoder()
        guard let payload = comicJSON.data(using: .utf8) else { XCTFail(); return }
        comic = try decoder.decode(Comic.self, from: payload)
    }

    func testTitle() {
        XCTAssertEqual(comic?.title, "safe_title")
    }

    func testAlt() {
        XCTAssertEqual(comic?.alt, "alt")
    }

    func testImg() {
        XCTAssertEqual(comic?.imageUrl, "img")
    }
}
