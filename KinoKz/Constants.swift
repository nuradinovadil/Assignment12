//
//  Constants.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 28/01/23.
//

import Foundation

struct Constants {
    
    struct Keys {
        static let api = "5013ae8d9b8817b8932df21e776d0c63"
    }
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionViewCell"
        static let categoryTableViewCell = "CategoryTableViewCell"
        static let placesTableViewCell = "PlacesTableViewCell"
        static let movieCollectionViewCell = "MovieCollectionViewCell"
    }
    
    struct Values {
        static let cinemas: [String] = ["Cinema Dostyk Multiplex", "Lumiera Cinema (ЦУМ)", "KinoForum 10 ()", "Kinopark 11 () IMAX", "Chaplin MEGA Alma-Ata", "Chaplin MEGA PArk", "Kinopark 5 Premium Forum", "Cinema Dostyk Multiplex", "Lumiera Cinema (ЦУМ)", "KinoForum 10 ()"]
        static let addresses: [String] = ["Самал-2, д.111, уг.ул. Жолдасбекова, ТРЦ Достык плаза", "пр. Абылай хана, 62, Арбат", "ул. Сейфуллина, 617, ТРЦ Форум Алматы", "Самал-2, д.111, уг.ул. Жолдасбекова, ТРЦ Достык плаза", "пр. Абылай хана, 62, Арбат", "ул. Сейфуллина, 617, ТРЦ Форум Алматы", "Самал-2, д.111, уг.ул. Жолдасбекова, ТРЦ Достык плаза", "Самал-2, д.111, уг.ул. Жолдасбекова, ТРЦ Достык плаза", "пр. Абылай хана, 62, Арбат", "ул. Сейфуллина, 617, ТРЦ Форум Алматы"]
        static let images: [String] = ["cinema1", "cinema2", "cinema3", "cinema4", "cinema5", "cinema1", "cinema2", "cinema3", "cinema4", "cinema5"]
        
        static let urlList = [Links.trending, Links.nowPlaying, Links.popular, Links.toprated, Links.upcoming]
    }
    
    struct Links {
        static let apiUrl = "https://api.themoviedb.org/3/"
        static let trending = "\(apiUrl)trending/movie/day?api_key=\(Keys.api)"
        static let imageUrl = "https://image.tmdb.org/t/p/w500/"
        static let nowPlaying = "\(apiUrl)movie/now_playing?api_key=\(Keys.api)"
        static let popular = "\(apiUrl)movie/popular?api_key=\(Keys.api)"
        static let upcoming = "\(apiUrl)movie/upcoming?api_key=\(Keys.api)"
        static let toprated = "\(apiUrl)movie/top_rated?api_key=\(Keys.api)"
        
        
//        static let genresUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(Keys.api)&language=ru-RU"
//        static let nowPlayingUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(Keys.api)&language=ru-RU&page=1&region=ru"
//        static let popularUrl = "https://api.themoviedb.org/3/movie/popular?api_key=\(Keys.api)&language=ru-RU&page=1&region=ru"
//        static let upcominggUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(Keys.api)&language=ru-RU&page=1&region=ru"
//        static let imageUrl = "https://image.tmdb.org/t/p/w500/"
    }
    
    
}

enum Category: String, CaseIterable{
    case nowPlaying = "🔥Now Playing"
    case popular = "🎥Popular"
    case topRated = "📺Top Rated"
    case upcoming = "🎭Upcoming"
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
