//
//  Constants.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 28/01/23.
//

import Foundation

struct Constants {
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionViewCell"
        static let categoryTableViewCell = "CategoryTableViewCell"
        static let placesTableViewCell = "PlacesTableViewCell"
    }
    
    struct Values {
        static let cinemas: [String] = ["Cinema Dostyk Multiplex", "Lumiera Cinema (ЦУМ)", "KinoForum 10 ()", "Kinopark 11 () IMAX", "Chaplin MEGA Alma-Ata", "Chaplin MEGA PArk", "Kinopark 5 Premium Forum", "Cinema Dostyk Multiplex", "Lumiera Cinema (ЦУМ)", "KinoForum 10 ()"]
        static let addresses: [String] = ["Самал-2, д.111, уг.ул. Жолдасбекова, ТРЦ Достык плаза", "пр. Абылай хана, 62, Арбат", "ул. Сейфуллина, 617, ТРЦ Форум Алматы", "Самал-2, д.111, уг.ул. Жолдасбекова, ТРЦ Достык плаза", "пр. Абылай хана, 62, Арбат", "ул. Сейфуллина, 617, ТРЦ Форум Алматы", "Самал-2, д.111, уг.ул. Жолдасбекова, ТРЦ Достык плаза", "Самал-2, д.111, уг.ул. Жолдасбекова, ТРЦ Достык плаза", "пр. Абылай хана, 62, Арбат", "ул. Сейфуллина, 617, ТРЦ Форум Алматы"]
        static let images: [String] = ["cinema1", "cinema2", "cinema3", "cinema4", "cinema5", "cinema1", "cinema2", "cinema3", "cinema4", "cinema5"]
    }
    
    
}

enum Category: String, CaseIterable{
    case all = "🔥All"
    case streaming = "🎥Streaming"
    case onTV = "📺On TV"
    case inTheaters = "🎭In theaters"
}

enum Cinemas: String, CaseIterable {
    case cinemaOne = "Cinema Dostyk Multiplex"
    case cinemaTwo = "Lumiera Cinema (ЦУМ)"
    case cinemaThree = "KinoForum 10 ()"
    case cinemaFour = "Kinopark 11 () IMAX"
    case cinemaFive = "Chaplin MEGA Alma-Ata"
    case cinemaSix = "Chaplin MEGA PArk"
    case cinemaSeven = "Kinopark 5 Premium Forum"
}
