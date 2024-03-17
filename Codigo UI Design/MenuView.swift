//
//  MenuView.swift
//  Codigo UI Design
//
//  Created by Ibrahim Baisa on 16/03/24.
//

import SwiftUI

struct MenuItem {
    var iconName: String
    var name: String
}

struct MenuView: View {
    let menuItems: [MenuItem] = [
        MenuItem(iconName: "menu-1", name: "Map"),
        MenuItem(iconName: "menu-2", name: "Inhabitants"),
        MenuItem(iconName: "menu-3", name: "Shows"),
        MenuItem(iconName: "menu-4", name: "Shoppings"),
        MenuItem(iconName: "menu-5", name: "Dine"),
        MenuItem(iconName: "menu-6", name: "Meet & Greets")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(menuItems, id: \.name) { menuItem in
                    MenuCell(menuItem: menuItem)
                }
            }
            .padding()
        }
    }
}

struct MenuCell: View {
    let menuItem: MenuItem
    
    var body: some View {
        VStack {
            Image(menuItem.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding()
                .background(AppColor.menu)
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Text(menuItem.name)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .frame(width: 100, height: 100)
    }
}


#Preview {
    MenuView()
}
