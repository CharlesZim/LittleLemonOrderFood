//
//  MenuViewViewModel.swift
//  LittleLemonMenu
//
//  Created by Charles on 30/05/2024.
//

import Foundation
import SwiftUI


class MenuViewViewModel: ObservableObject{
    @Published var menuItems = [MenuCategory : [MenuItem]]()
    
    init(){
        menuItems[.food] = getFoodMocks()
        menuItems[.drinks] = getDrinkMocks()
        menuItems[.desserts] = getDessertMocks()
    }
    
    func getFoodMocks() -> [MenuItem]{
        var foods: [MenuItem] = []
        
        for i in 1..<12 {
            foods.append(MenuItem(
                price: Double.random(in: 10...20),
                title: "Food \(i)",
                menuCategory: .food,
                ordersCount: Int.random(in: 1...100),
                ingredients: [Ingredient.broccoli, Ingredient.carrot, Ingredient.pasta, Ingredient.tomatoSauce, Ingredient.spinach]
            ))
        }
        return foods
    }
    
    func getDrinkMocks() -> [MenuItem]{
        var drinks: [MenuItem] = []
        
        for i in 1..<9 {
            drinks.append(MenuItem(
                price: Double.random(in: 10...20),
                title: "Drink \(i)",
                menuCategory: .drinks,
                ordersCount: Int.random(in: 1...100),
                ingredients: [Ingredient.broccoli, Ingredient.carrot, Ingredient.pasta, Ingredient.tomatoSauce, Ingredient.spinach]
            ))
        }
        return drinks
    }
    
    func getDessertMocks() -> [MenuItem]{
        var desserts: [MenuItem] = []
        
        for i in 1..<4 {
            desserts.append(MenuItem(
                price: Double.random(in: 10...20),
                title: "Dessert \(i)",
                menuCategory: .desserts,
                ordersCount: Int.random(in: 1...100),
                ingredients: [Ingredient.broccoli, Ingredient.carrot, Ingredient.pasta, Ingredient.tomatoSauce, Ingredient.spinach]
            ))
        }
        return desserts
    }
}
