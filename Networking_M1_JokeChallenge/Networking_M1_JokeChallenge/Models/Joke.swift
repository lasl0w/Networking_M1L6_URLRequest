//
//  Joke.swift
//  Networking_M1_JokeChallenge
//
//  Created by tom montgomery on 7/6/24.
//

import Foundation

struct Joke: Decodable {
    // Decodable to go from JSON to our object struct
    // Endpoint: https://v2.jokeapi.dev/joke/Any?type=single
    
    var error: Bool?
    var category: String?
    var type: String?
    var joke: String?
    var flags: [Flag]?
    var id: Int?
    var safe: Bool?
    var lang: String?
    
}

struct Flag: Decodable {
    
    var nsfw: Bool?
    var religious: Bool?
    var political: Bool?
    var racist: Bool?
    var sexist: Bool?
    var explicit: Bool?
    
}
