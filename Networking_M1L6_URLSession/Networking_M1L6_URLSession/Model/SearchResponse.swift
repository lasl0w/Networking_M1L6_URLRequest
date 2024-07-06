//
//  SearchResponse.swift
//  Networking_M1L6_URLSession
//
//  Created by tom montgomery on 7/4/24.
//

import Foundation

struct SearchResponse: Decodable {
    // must conform to Codable to parse JSON
    // Decodable:  turn JSON data into structures
    // Encodable:  turn structures into JSON  data


    // just type in the props exactly as thekeys are represented!
    
    // optional so it doesn't crash if data is missing
    var total_results: Int?
    // would typically map to best practice naming totalResults
    var page: Int?
    var per_page: Int?
    var photos: [Photo]?
    var next_page: String?
    

}

struct Photo: Decodable {
    var id: Int?
    var width: Int?
    var height: Int?
    var url: String?
    var photographer: String?
    var photographer_url: String?
    var photographer_id: Int?
    var avg_color: String?
    var src: PhotoSize?
    
    var liked: Bool?
    var alt: String?
}

struct PhotoSize: Decodable {
    var original: String?
    var large2x: String?
    var large: String?
    var medium: String?
    var small: String?
    var portrait: String?
    var landscape: String?
    var tiny: String?
}
