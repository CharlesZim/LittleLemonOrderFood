//
//  MenuItemView.swift
//  LittleLemonMenu
//
//  Created by Charles on 30/05/2024.
//

import Foundation
import SwiftUI

struct MenuItemView: View {
    var menuItem: MenuItem
    
    var body: some View{
        VStack {
            Rectangle()
                .fill(.black)
                .frame(height: 70)
            Text(menuItem.title)
                .foregroundStyle(.black)
        }
    }
}
