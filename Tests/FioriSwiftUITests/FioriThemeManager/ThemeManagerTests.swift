@testable import FioriThemeManager
import SwiftUI
import UIKit
import XCTest

class ThemeManagerTests: XCTestCase {
    func testPaletteV6() throws {
        let tm = ThemeManager.shared
        tm.setPaletteVersion(.v6)
        XCTAssertEqual(ColorStyle.allCases.count, 132)
        XCTAssertEqual(tm.paletteVersion?.supportedStyles().count, 132)
        XCTAssertEqual(tm.paletteVersion?.obsoletedStyles().count, 38)
        XCTAssertEqual(tm.paletteVersion?.newStyles().count, 78)
        let newStyle_grey1 = tm.hexColor(for: .grey1)
        XCTAssertEqual(newStyle_grey1, HexColor(lightColor: "111D29FF", darkColor: "F5F6F7FF", contrastLightColor: "000000FF", contrastDarkColor: "E8EBEDFF"))
        let newStyle_primaryLabel = tm.hexColor(for: .primaryLabel)
        XCTAssertEqual(newStyle_primaryLabel, HexColor(lightColor: "F5F6F7FF", darkColor: "223548FF", contrastLightColor: "FFFFFFFF", contrastDarkColor: "000000FF"))
        let obsoletedStyle_line = tm.hexColor(for: .line)
        XCTAssertEqual(obsoletedStyle_line, HexColor(lightColor: "8696A9", darkColor: "89919A"))
        let obsoletedStyle_negative = tm.hexColor(for: .negative)
        XCTAssertEqual(obsoletedStyle_negative, HexColor(lightColor: "FF8888", darkColor: "BB0000"))
    }
    
    func testPaletteV5() throws {
        let tm = ThemeManager.shared
        tm.setPaletteVersion(.v5)
        let v5Style_primary1 = tm.hexColor(for: .primary1)
        XCTAssertEqual(v5Style_primary1, HexColor(lightColor: "FAFAFA", darkColor: "32363A"))
        let v5Style_tintColor = tm.hexColor(for: .tintColor)
        XCTAssertEqual(v5Style_tintColor, HexColor(lightColor: "91C8F6", darkColor: "0A6ED1", contrastLightColor: "91C8F6", contrastDarkColor: "91C8F6"))
        let v5Style_primaryLabel = tm.hexColor(for: .primaryLabel)
        XCTAssertEqual(v5Style_primaryLabel, HexColor(lightColor: "FAFAFA", darkColor: "32363A", contrastLightColor: "FAFAFA", contrastDarkColor: "FAFAFA"))
        let v5Style_shell = tm.hexColor(for: .shell)
        XCTAssertEqual(v5Style_shell, HexColor(lightColor: "2C3D4F", darkColor: "354A5F"))
        let v5FutureStyle_cardShadow = tm.hexColor(for: .cardShadow)
        XCTAssertEqual(v5FutureStyle_cardShadow, HexColor(lightColor: "000000"))
    }
    
    func testPaletteV4() throws {
        let tm = ThemeManager.shared
        tm.setPaletteVersion(.v4)
        let v4Style_primary1 = tm.hexColor(for: .primary1)
        XCTAssertEqual(v4Style_primary1, HexColor(lightColor: "FFFFFF", darkColor: "32363A"))
        let v4Style_tintColor = tm.hexColor(for: .tintColor)
        XCTAssertEqual(v4Style_tintColor, HexColor(lightColor: "D1E8FF", darkColor: "0A6ED1"))
        let v4Style_line = tm.hexColor(for: .line)
        XCTAssertEqual(v4Style_line, HexColor(lightColor: "38383A", darkColor: "F3F3F3"))
        let v4Style_negative = tm.hexColor(for: .negative)
        XCTAssertEqual(v4Style_negative, HexColor(lightColor: "FF453A", darkColor: "BB0000"))
        let v4FutureStyle_primaryLabel = tm.hexColor(for: .primaryLabel)
        XCTAssertEqual(v4FutureStyle_primaryLabel, HexColor(lightColor: "FFFFFF", darkColor: "32363A"))
    }
}
