//
//  MenuItemsView.swift
//  LittleLemonMenu
//
//  Created by Charles on 30/05/2024.
//

import Foundation
import SwiftUI

struct MenuItemsView: View {
    @State var showFilters = false
    @ObservedObject var menuViewViewModel = MenuViewViewModel()
    
    @State var filterOption: MenuCategory = .all
    @State var sortOption: SortOption = .popular
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading) {
                    ForEach(MenuCategory.allCases, id: \.self) { category in
                        if !getFilterAndSortedMenuItems().filter({ $0.menuCategory == category}).isEmpty && category != .all {
                            Section(header: Text(category.rawValue).font(.title2).fontWeight(.medium)) {
                                LazyVGrid(columns: columns, spacing: 10) {
                                    ForEach(getFilterAndSortedMenuItems().filter { $0.menuCategory == category }, id: \.id) { menuItem in
                                        NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
                                            MenuItemView(menuItem: menuItem)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Menu")
            .navigationBarItems(trailing: Button(action: {
                self.showFilters.toggle()
            }, label: {
                Label("Filter", systemImage: "slider.horizontal.3")
            }))
        }
        .sheet(isPresented: $showFilters) {
            MenuItemsOptionView(showMenuItemsOptionView: $showFilters, filterOption: $filterOption, sortOption: $sortOption)
        }
    }
    
    func getFilterAndSortedMenuItems() -> [MenuItem] {
        var filteredMenuItems = menuViewViewModel.menuItems.flatMap { $0.value }
        
            filteredMenuItems = filteredMenuItems.filter { $0.menuCategory == filterOption || filterOption == .all}
        
        switch sortOption {
        case .popular:
            filteredMenuItems.sort { $0.ordersCount < $1.ordersCount }
        case .price:
            filteredMenuItems.sort { $0.price < $1.price }
        case .alphabetical:
            filteredMenuItems.sort { $0.title < $1.title }
        }
        
        return filteredMenuItems
    }
}


struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
