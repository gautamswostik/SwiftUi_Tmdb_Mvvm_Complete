//
//  TrendingViewModel.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 11/03/2023.
//

import Foundation

class TrendingViewModel : ObservableObject {
    @Published var errorMessage: String = String()
    @Published var loading: Bool = Bool()
    @Published var trendingData: TrendingData = TrendingData()
    @Published var moviesTrendingData: TrendingData = TrendingData()
    @Published var tvTrendingData: TrendingData = TrendingData()
    @Published var upComingMovieData: TrendingData = TrendingData()
    @Published var searchedMovies: TrendingData = TrendingData()
    @Published var moviesloading: Bool = Bool()
    @Published var tvloading: Bool = Bool()
    @Published var upcomingLoading: Bool = Bool()
    @Published var searchLoading: Bool = Bool()
    
    private let tmdbApiService = TMDBApiService()
    
    init() {
        fetchTrendingData()
        fetchMoviesTrendingData()
        fetchTvTrendingData()
        fetchUpcomingData()
    }
    
    func fetchTrendingData() {
        DispatchQueue.main.async {
            self.loading = true
            self.tmdbApiService.fetchTrendingData { trendingData in
                switch trendingData {
                case .success(let trending):
                    self.trendingData = trending
                    self.loading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.loading = false
                }
            }
        }
    }
    
    func fetchMoviesTrendingData() {
        DispatchQueue.main.async {
            self.moviesloading = true
            self.tmdbApiService.fetchMoviesTrendingData { trendingData in
                switch trendingData {
                case .success(let trending):
                    self.moviesTrendingData = trending
                    self.moviesloading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.moviesloading = false
                }
            }
        }
    }
    func fetchTvTrendingData() {
        DispatchQueue.main.async {
            self.tvloading = true
            self.tmdbApiService.fetchTvTrendingData { trendingData in
                switch trendingData {
                case .success(let trending):
                    self.tvTrendingData = trending
                    self.tvloading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.tvloading = false
                }
            }
        }
    }
    func fetchUpcomingData() {
        DispatchQueue.main.async {
            self.upcomingLoading = true
            self.tmdbApiService.fetchUpcomingMoviesData { trendingData in
                switch trendingData {
                case .success(let trending):
                    self.upComingMovieData = trending
                    self.upcomingLoading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.upcomingLoading = false
                }
            }
        }
    }
    
    func searchMovies(name:String) {
        DispatchQueue.main.async {
            self.searchLoading = true
            self.tmdbApiService.searchMovie(name: name) { trendingData in
                switch trendingData {
                case .success(let trending):
                    self.searchedMovies = trending
                    self.searchLoading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.searchLoading = false
                }
            }
        }
    }
}
