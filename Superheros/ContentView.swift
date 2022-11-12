//
//  ContentView.swift
//  Superheros
//
//  Created by Tolba on 10/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    var superheros : [Superhero] = superherosData
    
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(superheros) { item in
                    SuperheroView(superHeroData: item)
                }
            }//: HStack
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
