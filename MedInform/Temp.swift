//
//  Temp.swift
//  MedInform
//
//  Created by Student on 5/2/22.
//

import SwiftUI

struct Temp: View {
    var body: some View {
        
        NavigationView {
            NavigationLink(destination: MapView(), label: {
                Text("Map")
            })
        }
    }
}

struct Temp_Previews: PreviewProvider {
    static var previews: some View {
        Temp()
    }
}
