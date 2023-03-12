//
//  AppUrls.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 11/03/2023.
//

import Foundation

class ApiUrls {
    static var BASE_URL = "https://api.themoviedb.org"
    static var TRENDING_URL = "\(BASE_URL)/3/trending/all/day"
    static var TRENDING_MOVIES_URL = "\(BASE_URL)/3/trending/movie/day"
    static var TRENDING_TV_URL = "\(BASE_URL)/3/trending/tv/day"
    static var UPCOMING_MOVIES = "\(BASE_URL)/3/movie/upcoming"
    static var SEARCH_MOVIES = "\(BASE_URL)/3/search/movie"
}



