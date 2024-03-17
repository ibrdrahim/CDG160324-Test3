//
//  ContentView.swift
//  Codigo UI Design
//
//  Created by Ibrahim Baisa on 16/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // First tab
            HomeView()
                .tabItem {
                    Image("home")
                    Text("Home")
                }
                .tag(0)
            
            // Second tab
            Text("Wallet")
                .tabItem {
                    Image(systemName: "wallet.pass.fill")
                    Text("Wallet")
                }
                .tag(1)
            
            // Third tab
            Text("More")
                .tabItem {
                    Image("more")
                    Text("More")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
