//
//  ContentView.swift
//  TravelApp
//
//  Created by Rajeev R Menon on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    
    @StateObject var feedViewModel = FeedViewModel()
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            FeedView()
                .environmentObject(feedViewModel)
                .tabItem {
                    Image(systemName: "house")
                }.tag(1)
            
            FeedView()
                .environmentObject(feedViewModel)
                .tabItem {
                    Image(systemName: "plus.circle")
                }.tag(2)
            
            FeedView()
                .environmentObject(feedViewModel)
                .tabItem {
                    Image(systemName: "suitcase")
                }.tag(3)
        }
        .accentColor(.primary)
    }
}

#Preview {
    ContentView()
}
