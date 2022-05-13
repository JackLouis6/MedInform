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
                             block: { _ in
                                self.date = Date()
                             })
    }
    
    func greeting() -> String {
        var message = ""
        let morningStart = Calendar.current.date(bySettingHour: 4, minute: 00, second: 0, of: date)!
        let morningEnd = Calendar.current.date(bySettingHour: 11, minute: 59, second: 59, of: date)!
        //        let evening = Calendar.current.date(bySettingHour: <#T##Int#>, minute: <#T##Int#>, second: <#T##Int#>, of: <#T##Date#>)
        
        if ((date >= morningStart) && (morningEnd >= date)) {
            message = "Good morning!"
        } else {
            message = "Woah, it's not morning! Try checking back in tomorrow for new information."
        }
        return message
    }
    
    var body: some View {
        VStack {
            Text("\(timeString(date: date))")
                .font(.system(size:50))
                .bold()
                .padding()
            Text(greeting())
                .multilineTextAlignment(.center)
                .font(.system(size:35))
                .font(.title3)
                .padding()
                
                .onAppear(perform: {let _ = self.updateTimer})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
