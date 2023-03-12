//
//  ContentView.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 11/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tmdbDataModel = TrendingViewModel()
    var body: some View {
        if(tmdbDataModel.loading) {
            ZStack {
                Color.white.ignoresSafeArea(.all)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }else {
            NavigationView {
                TabView {
                    ZStack{
                        ScrollView {
                            VStack{
                                MovieCard(trendindMovies: tmdbDataModel.trendingData.results ?? [])
                                TrendingView(title: "Trending Movies",
                                             trendindMovies: tmdbDataModel.moviesTrendingData.results ?? []
                                )
                                TrendingView(title: "Trending Tv",
                                             trendindMovies: tmdbDataModel.tvTrendingData.results ?? []
                                )
                                TrendingView(title: "Upcoming Movies",
                                             trendindMovies: tmdbDataModel.upComingMovieData.results ?? []
                                )
                            }.padding(.bottom , UIScreen.main.bounds.height*0.10)
                        }
                        .ignoresSafeArea()
                    }.tabItem {
                        Image(systemName: "popcorn.circle")
                        Text("Movies").font(.system(size: 22,weight: .bold,design: .monospaced))
                    }
                    SearchView(trendingViewModel: tmdbDataModel).tabItem {
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Search").font(.system(size: 22,weight: .bold,design: .monospaced))
                    }
                        
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
