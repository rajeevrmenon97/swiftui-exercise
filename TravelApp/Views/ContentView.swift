//
//  ContentView.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Label("", systemImage: "house")
                }.tag(1)
            
            FeedView()
                .toolbarBackground(.visible, for: .navigationBar, .tabBar)
                .tabItem {
                    Label("", systemImage: "plus.circle")
                }.tag(2)
            
            FeedView()
                .tabItem {
                    Label("", systemImage: "suitcase")
                }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
