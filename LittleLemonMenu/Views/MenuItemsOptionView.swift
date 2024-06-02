//
//  MenuItemsOptionView.swift
//  LittleLemonMenu
//
//  Created by Charles on 30/05/2024.
//

import Foundation
import SwiftUI


struct MenuItemsOptionView: View {
    @Binding var showMenuItemsOptionView: Bool
    @Binding var filterOption: MenuCategory
    @Binding var sortOption: SortOption
    
    var body: some View {
        NavigationView {
                Form {
                    Section(header: Text("Selected categories")) {
                        Picker("", selection: $filterOption) {
                            ForEach(MenuCategory.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }
                        .pickerStyle(.inline)
                        .labelsHidden()
                    }
                    
                    Section(header: Text("Sort by")) {
                        Picker("", selection: $sortOption) {
                            ForEach(SortOption.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }
                        .pickerStyle(.inline)
                        .labelsHidden()
                    }
                }
            .navigationTitle("Filter")
            .navigationBarItems(trailing: Button(action: {
                self.showMenuItemsOptionView.toggle()
            }, label: {
                Text("Done")
            }))
        }
    }
}
