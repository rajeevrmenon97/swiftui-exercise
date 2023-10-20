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
                    Image(systemName: "house")
                }.tag(1)
            
            FeedView()
                .tabItem {
                    Image(systemName: "plus.circle")
                }.tag(2)
            
            FeedView()
                .tabItem {
                    Image(systemName: "suitcase")
                }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
