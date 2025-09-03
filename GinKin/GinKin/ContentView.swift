//
//  ContentView.swift
//  GinKin
//
//  Created by Gregg Abe on 8/31/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(0)

            // Search Tab
            NavigationStack {
                EmptyView()
            }
            .tabItem {
                Image(systemName: "dollarsign.circle")
                Text("Stack")
            }
            .tag(1)

            // Profile Tab
            NavigationStack {
                EmptyView()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            .tag(2)
        }
    }
}
