//
//  MenuItemDetailsView.swift
//  LittleLemonMenu
//
//  Created by Charles on 30/05/2024.
//

import Foundation
import SwiftUI

struct MenuItemDetailsView: View {
    var menuItem: MenuItem
    let formatter = NumberFormatter()
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
        formatter.numberStyle = .currency
    }
    
    var body: some View{
        
        NavigationStack{
            ScrollView {
                VStack {
                    Image("Little Lemon logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                    Text("Price:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(formatter.string(from: NSNumber(value: menuItem.price)) ?? "")
                    Text("Ordered:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(String(menuItem.ordersCount))
                    Text("Ingredients:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ForEach(menuItem.ingredients, id: \.self) { ingredient in
                        Text(ingredient.rawValue)
                    }
                }
            }
            .navigationTitle(menuItem.title)
        }
    }
}
