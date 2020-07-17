//
//  SwiftUI_LoginScreenUITests.swift
//  SwiftUI_LoginScreenUITests
//
//  Created by BSAL-MAC on 5/28/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import XCTest

class SwiftUI_LoginScreenUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        //super.setUp()
        continueAfterFailure = false
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    

    func test_login_screen() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        for _ in 0...5 {
        let signUp = app.buttons["SignUp.next"]
        XCTAssertTrue(signUp.exists)
        signUp.tap()
        
        let taskNametextfield = app.textFields["emailTF"]
        //XCTAssertTrue(taskNametextfield.exists)
        taskNametextfield.tap()
        taskNametextfield.typeText("vsal55555@gmail.com") //also type return key so that keyboard goes away.
        
        let taskNamesecurefield = app.secureTextFields["passwordTF"]
        taskNamesecurefield.tap()
        taskNamesecurefield.typeText("password")
        
        let tasknamesignInButton = app.buttons["signInbutton"]
        tasknamesignInButton.tap()
            
        let backbutton = app.navigationBars.buttons["Back"]
        XCTAssertTrue(backbutton.exists)
        backbutton.tap()
        }
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
    }

    
}
