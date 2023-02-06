//
//  GenreData.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 06/02/23.
//

import Foundation


struct GenreData: Decodable {
    let genres: [Genre]
    
    struct Genre: Decodable {
        let id: Int
        let name: String
        
    }
}
