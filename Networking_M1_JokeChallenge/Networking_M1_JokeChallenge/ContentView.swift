//
//  ContentView.swift
//  Networking_M1_JokeChallenge
//
//  Created by tom montgomery on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var jokeText = "Click for a joke!"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Spacer()
            Text(jokeText)
            Spacer()
            Button(action: getJoke, label: {
                Text("Get Another Joke!")
            })
        }
        .padding()
    }
    
    func getJoke() {
        print("Getting a joke")
        Task {
            // 1 - Build the URL - no dynamic params so easy peazy
            if let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=single") {
                // If the url is good, make the request
                // 2 - URLRequest - no need for header on this one
                let request = URLRequest(url: url)
                
                // 3 - URLSession - its async and it throws
                // wrap in a do-try-catch to handle the error
                do {
                    
                    let (data, response) = try await URLSession.shared.data(for: request)
                    // 4 - Parse the JSON
                    let decoder = JSONDecoder()
                    do {
                        let jokeResponse = try decoder.decode(Joke.self, from: data)
                        print(jokeResponse.joke ?? "no joke here...")
                        jokeText = jokeResponse.joke!
                        
                    }
                    catch {
                        // Couldn't decode the response
                        print(error)
                    }
                }
                catch {
                    // URLSession.shared.data failed
                    print(error)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
