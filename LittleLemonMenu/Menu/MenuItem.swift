//
//  MenuItem.swift
//  LittleLemonMenu
//
//  Created by Charles on 30/05/2024.
//

import Foundation


protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var ingredients: [Ingredient] { get set }
}


struct MenuItem: Identifiable, MenuItemProtocol {
    var id: UUID = UUID()
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var ordersCount: Int = 0
    var ingredients: [Ingredient]
}
