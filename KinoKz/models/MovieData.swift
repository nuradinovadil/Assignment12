//
//  MovieData.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 05/02/23.
//

import Foundation

struct MovieData: Decodable {
    let results: [Results]
    
    struct Results: Decodable {
        let backdrop_path: String?
        let id: Int
        let title: String
        let poster_path: String
        let genre_ids: [Int]
        
    }
}


