//
//  ContentView.swift
//  MedInform
//
//  Created by Student on 3/31/22.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        Text("Weclome to MedInform")
            .padding()
        
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("Notification Set")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Take my medication"
                content.subtitle = "Advil"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
