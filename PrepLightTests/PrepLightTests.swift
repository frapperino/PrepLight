//
//  PrepLightTests.swift
//  PrepLightTests
//
//  Created by Fredrik Holmdahl on 2018-12-13.
//  Copyright © 2018 Fredrik Holmdahl. All rights reserved.
//

import XCTest
@testable import PrepLight

class PrepLightTests: XCTestCase {

    func testStartScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startscreen = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let _ = startscreen.view
        XCTAssertEqual("Get started", startscreen.getStartedButton.titleLabel!.text!)
    }
}
