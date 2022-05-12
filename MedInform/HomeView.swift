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
            ExerciseView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Exercises")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
