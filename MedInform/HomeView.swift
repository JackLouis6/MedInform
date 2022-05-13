//
//  HomeView.swift
//  MedInform
//
//  Created by Student on 5/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            QuoteView()
                .tabItem {
                    Image(systemName: "book.closed")
                    Text("Fact of the Day")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Breakfast Map")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
