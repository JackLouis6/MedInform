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
            VStack {
                HStack {
                NavigationLink(destination: ExerciseView(), label: {
                    Text("Exercise Database")
                        .bold()
                        .frame(width: 160, height: 110)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        .position(x: 110, y: 75)
                })
                
                NavigationLink(destination: MapView(), label: {
                    Text("Find Local Gyms")
                        .bold()
                        .frame(width: 160, height: 110)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        .position(x: 90, y: 75)
                })

                }
            }
            .navigationTitle("Welcome to FitInform")
            
            .background(
                Image("HomeScreenWeight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600, alignment: .center)
                    .offset(y: 127.5)
            )
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
