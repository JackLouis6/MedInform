//
//  ContentView.swift
//  MedInform
//
//  Created by Student on 3/31/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
       
        
        
        
        
        
        
        
        
        
        
        
        
        NavigationView {
            NavigationLink(destination: MapView(), label: {
                Text("Map")
            })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
