//
//  MovieCard.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 11/03/2023.
//

import SwiftUI

struct MovieCard: View {
    var trendindMovies: [TrendingResult]
    var body: some View {
                TabView {
                    ForEach(trendindMovies, id: \.id) { movie in
                        MovieImage(movie: movie)
                    }
                }
                .cornerRadius(20)
                .frame(height: UIScreen.main.bounds.height*0.80)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    
    }
}
