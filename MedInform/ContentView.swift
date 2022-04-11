//
//  ContentView.swift
//  MedInform
//
//  Created by Student on 3/31/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Welcome to MedInform. This app will be used to benefit your medical needs. You will get reminders to take your medications and what medications to take.")
            .font(.body)
            .fontWeight(.heavy)
            .foregroundColor(Color.black)
            .multilineTextAlignment(.center)
            .padding(2.0)
        
        NavigationLink(destination: Reminder(), label: {
            Text("Reminder")
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
