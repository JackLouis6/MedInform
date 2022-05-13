//
//  QuoteView.swift
//  MedInform
//
//  Created by Student on 5/13/22.
//

import SwiftUI

struct QuoteView: View {
    @State private var quotes = [Quote]()
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            List(quotes) { quote in
                        HStack {
                            Text(quote.fact)
                }
            }
            .navigationTitle("Quote of the Day")
        }
        .onAppear(perform: {
            getQuotes()
        })
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text("Loading Error"),
                  message: Text("There was a problem loading the Quote"),
                  dismissButton: .default(Text("OK")))
        })
    }
    
    func getQuotes() {
        let apiKey = "rapidapi-key=11e76f41famsh4a8f4c04d83db94p14e066jsndbc159a476f9"
        let query = "https://random-facts2.p.rapidapi.com/getfact?\(apiKey)"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                if json["response"] == "success" {
                    let contents = json.arrayValue
                    for item in contents {
                        let fact = item["Fact"].stringValue
                        let quote = Quote(fact: fact)
                        quotes.append(quote)
                    }
                    return
                }
            }
        }
        showingAlert = true
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}

struct Quote: Identifiable {
    let id = UUID()
    var fact: String
}
