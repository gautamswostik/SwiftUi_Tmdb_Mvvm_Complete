//
//  MoviesSlider.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 11/03/2023.
//

import SwiftUI

struct MovieImage: View {
    let movie: TrendingResult
    var body: some View {
        NavigationLink(destination: TmdbDetailsView(movie: movie)){
        ZStack{
            AsyncImage(url: URL(string: posterUrl(path: movie.poster_path ?? ""))) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .overlay(Material.ultraThin)
            } placeholder: {
                Color.gray.opacity(0.1)
            }
            .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height*0.80)
            
            AsyncImage(url: URL(string: posterUrl(path: movie.poster_path ?? ""))){ image in
                image
                    .resizable()
            } placeholder: {
                Color.black.opacity(0.1)
            }
            .frame(width:UIScreen.main.bounds.width*0.80, height:  UIScreen.main.bounds.height*0.60)
            .cornerRadius(20)
        }
            
        }
    }
}

func posterUrl(path:String) -> String {
    return "https://image.tmdb.org/t/p/original\(path)"
}
