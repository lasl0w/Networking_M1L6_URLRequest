//
//  ContentView.swift
//  Networking_M1_JokeChallenge
//
//  Created by tom montgomery on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Spacer()
            Button(action: getJoke, label: {
                Text("Get Another Joke!")
            })
        }
        .padding()
    }
    
    func getJoke() {
        print("Getting a joke")
    }
}

#Preview {
    ContentView()
}
