//
//  ContentView.swift
//  MedInform
//
//  Created by Student on 3/31/22.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    
    var timeOrder: DateFormatter {
        let order = DateFormatter()
        order.dateFormat = "hh:mm a"
        return order
    }
    
    
    func timeString(date: Date) -> String {
        let time = timeOrder.string (from: date)
        return time
    }
    
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                             block: {_ in
                                self.date = Date()
                             })
    }
    
    func greeting() -> String {
        var greet = ""
    let midNight0 = Calendar.current.date(bySettingHour: 0, minute: 00, second: 00, of: date)!
         let nightEnd = Calendar.current.date(bySettingHour: 3, minute: 59, second: 59, of: date)!
         let morningStart = Calendar.current.date(bySettingHour: 4, minute: 00, second: 0, of: date)!
         let morningEnd = Calendar.current.date(bySettingHour: 11, minute: 59, second: 59, of: date)!
         let noonStart = Calendar.current.date(bySettingHour: 12, minute: 00, second: 00, of: date)!
         let noonEnd = Calendar.current.date(bySettingHour: 16, minute: 59, second: 59, of: date)!
         let eveStart = Calendar.current.date(bySettingHour: 17, minute: 00, second: 00, of: date)!
         let eveEnd = Calendar.current.date(bySettingHour: 20, minute: 59, second: 59, of: date)!
         let nightStart = Calendar.current.date(bySettingHour: 21, minute: 00, second: 00, of: date)!
         let midNight24 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
        
        if ((date >= midNight0) && (nightEnd >= date)) {
                  greet = "Good Night."
             } else if ((date >= morningStart) && (morningEnd >= date)) {
                  greet = "Good Morning."
             } else if ((date >= noonStart) && (noonEnd >= date)) {
                  greet = "Good Afternoon."
             } else if ((date >= eveStart) && (eveEnd >= date)) {
                  greet = "Good Evening."
             } else if ((date >= nightStart) && (midNight24 >= date)) {
                  greet = "Good night."
             }
             return greet
    }
    
    var body: some View {
        
        
        NavigationView {
            VStack {
            
                Text("\(timeString(date: date))")
                    Text(greeting())
                    .onAppear(perform: {let _ = self.updateTimer})
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            Menu {
                                Button(action: {}, label: {
                                    Label(
                                        title: { Text("Add File") },
                                        icon: { Image(systemName: "plus")}
                                    
                                    )
                                })
                                Button(action: {}, label: {
                                    Label(
                                        title: { Text("Appearance") },
                                        icon: { Image(systemName: "circle.dashed")}
                                    
                                    )
                                })
                                Button(action: {}, label: {
                                    Label(
                                        title: { Text("Rate Us") },
                                        icon: { Image(systemName: "star")}
                                    
                                    )
                                })
                                Button(action: {}, label: {
                                    Label(
                                        title: { Text("Policy") },
                                        icon: { Image(systemName: "doc")}
                                    
                                    )
                                })
                            } label: {
                                Label(
                                    title: { Text("Settings") },
                                    icon: {Image(systemName: "gear") }
                                )
                            }
                        }
                    }
            }
            .navigationTitle("FitInform")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
