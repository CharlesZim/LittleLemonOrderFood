//
//  LittleLemonMenuTests.swift
//  LittleLemonMenuTests
//
//  Created by Charles on 30/05/2024.
//

import XCTest
@testable import LittleLemonMenu

final class LittleLemonMenuTests: XCTestCase {
    
    func test_menuTitle_init() {
        let menuItem = MenuItem(price: 10.0, title: "Pizza", menuCategory: .food, ingredients: [Ingredient.broccoli])
        XCTAssertEqual(menuItem.title, "Pizza")
    }
    
    func test_menuIngredients_init() {
        let ingredients = [Ingredient.broccoli]
        let menuItem = MenuItem(price: 10.0, title: "Pizza", menuCategory: .food, ingredients: ingredients)
        XCTAssertEqual(menuItem.ingredients, ingredients)
    }
}
