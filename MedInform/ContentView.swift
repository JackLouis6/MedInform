//
//  ContentView.swift
//  MedInform
//
//  Created by Student on 3/31/22.
//

import SwiftUI


struct ContentView: View {
    @State private var exercises = [Exercise]()
    @State private var showingAlert = false
    init () {
        UITableView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        NavigationView {
            List(exercises) { exercise in
                if let url = URL(string: exercise.gifUrl) {
                    Link(destination: url) {
                        HStack {
                            Text(exercise.bodyPart)
                            Text("-")
                            Text(exercise.equipment)
                            Text("-")
                            Text(exercise.gifUrl)
                            Text(exercise.name)
                            Text(exercise.target)
                        }
                    }
                }
            }
            .navigationTitle("Exercises")
    }
        .onAppear(perform: {
            getExercises()
        })
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text("Loading Error"),
                  message: Text("There was a problem loading the Exercises"),
                  dismissButton: .default(Text("OK")))
        })
    }
    
    func getExercises() {
        let apiKey = "rapidapi-key=11e76f41famsh4a8f4c04d83db94p14e066jsndbc159a476f9"
        let query = "https://exercisedb.p.rapidapi.com/exercises?\(apiKey)"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                let contents = json.arrayValue
                for item in contents {
                    let bodyPart = item["bodyPart"].stringValue
                    let equipment = item["equipment"].stringValue
                    let gifUrl = item["gifUrl"].stringValue
                    let name = item["name"].stringValue
                    let target = item["target"].stringValue
                    let exercise = Exercise(bodyPart: bodyPart, equipment: equipment, gifUrl: gifUrl, name: name, target: target)
                    exercises.append(exercise)
                }
                return
            }
        }
        showingAlert = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Exercise: Identifiable {
    let id = UUID()
    var bodyPart: String
    var equipment: String
    var gifUrl: String
    var name: String
    var target: String
    
}
