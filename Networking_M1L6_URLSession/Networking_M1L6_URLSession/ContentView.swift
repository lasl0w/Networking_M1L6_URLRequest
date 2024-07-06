//
//  ContentView.swift
//  Networking_M1L6_URLSession
//
//  Created by tom montgomery on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            // put it in a task to be async
            Task {
                // system might choose to use a background thread
                await apiCall()
            }
        }
    }
    
    func apiCall() async {
        // 1. Build URL - use Pexels search for photos endpoint
        if let url = URL(string: "https://api.pexels.com/v1/search?query=nature&per_page=1") {
            
            // 2. URLRequest
            var request = URLRequest(url: url)
            // how to set an HTTP header
            request.addValue("PWUp6sAtMGRrY1HPn8r6nOw8qOCdsc136yAdSyL6Y5m1WEDSc2cCitjh", forHTTPHeaderField: "Authorization")

            // 3. URLSession - it's async and it throws
            // Can't just use the URL b/c there is a header.  gotta pass the whole URLRequest
            do {
                let (data, response) = try await 
                URLSession.shared.data(for: request)
                // URLRequest returns a tuple (Data, response).  Quick Help
                
                // 4. Parse the JSON
                let decoder = JSONDecoder()
                // when we use .self, we are declaring that structure as the type we will pass into
                do {
                    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                    // (lldb) $  po searchRespone - will give the whole response
                    for photo in searchResponse.photos! {
                        print(photo)
                    }
                }
                catch {
                    print(error)
                }
              
                print(data)
                print(response)
                // don't need to open another task block b/c it's already called in one
            }
            catch {
                print(error)
            }

            
            // take note of the response example in the Pexels API getting started area!
        }
        
        

        

    }
}

#Preview {
    ContentView()
}
