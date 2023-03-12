//
//  TmdbDataService.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 11/03/2023.
//

import Foundation
import Alamofire

class TMDBApiService {
    
    func fetchTrendingData(completionHandler: @escaping(Result<TrendingData , Error>) -> Void) {
        AF.request(ApiUrls.TRENDING_URL , method: .get , parameters: [
            "api_key": ApiConstants.API_KEY
        ])
        .validate(statusCode: 200..<500)
        .response { response in
            switch response.result {
            case .success(let data):
                if((200...299).contains(response.response!.statusCode)){
                    guard let trendingData = data else {return}
                    let decoder = JSONDecoder()
                    do {
                        let trendingData  = try decoder.decode(TrendingData.self, from: trendingData)
                        completionHandler(.success(trendingData))
                    } catch let error  {
                        completionHandler(.failure(ApiError.parsing(error as? DecodingError)))
                    }
                }
                else {
                    completionHandler(.failure(ApiError.badResponse(statusCode: response.response!.statusCode)))
                }
            case .failure(_):
                completionHandler(.failure(ApiError.unknown))
            }
        }
    }
    func fetchMoviesTrendingData(completionHandler: @escaping(Result<TrendingData , Error>) -> Void) {
        AF.request(ApiUrls.TRENDING_MOVIES_URL , method: .get , parameters: [
            "api_key": ApiConstants.API_KEY
        ])
        .validate(statusCode: 200..<500)
        .response { response in
            switch response.result {
            case .success(let data):
                if((200...299).contains(response.response!.statusCode)){
                    guard let trendingData = data else {return}
                    let decoder = JSONDecoder()
                    do {
                        let trendingData  = try decoder.decode(TrendingData.self, from: trendingData)
                        completionHandler(.success(trendingData))
                    } catch let error  {
                        completionHandler(.failure(ApiError.parsing(error as? DecodingError)))
                    }
                }
                else {
                    completionHandler(.failure(ApiError.badResponse(statusCode: response.response!.statusCode)))
                }
            case .failure(_):
                completionHandler(.failure(ApiError.unknown))
            }
        }
    }
    
    func fetchTvTrendingData(completionHandler: @escaping(Result<TrendingData , Error>) -> Void) {
        AF.request(ApiUrls.TRENDING_TV_URL , method: .get , parameters: [
            "api_key": ApiConstants.API_KEY
        ])
        .validate(statusCode: 200..<500)
        .response { response in
            switch response.result {
            case .success(let data):
                if((200...299).contains(response.response!.statusCode)){
                    guard let trendingData = data else {return}
                    let decoder = JSONDecoder()
                    do {
                        let trendingData  = try decoder.decode(TrendingData.self, from: trendingData)
                        completionHandler(.success(trendingData))
                    } catch let error  {
                        completionHandler(.failure(ApiError.parsing(error as? DecodingError)))
                    }
                }
                else {
                    completionHandler(.failure(ApiError.badResponse(statusCode: response.response!.statusCode)))
                }
            case .failure(_):
                completionHandler(.failure(ApiError.unknown))
            }
        }
    }
    
    func fetchUpcomingMoviesData(completionHandler: @escaping(Result<TrendingData , Error>) -> Void) {
        AF.request(ApiUrls.UPCOMING_MOVIES , method: .get , parameters: [
            "api_key": ApiConstants.API_KEY
        ])
        .validate(statusCode: 200..<500)
        .response { response in
            switch response.result {
            case .success(let data):
                if((200...299).contains(response.response!.statusCode)){
                    guard let trendingData = data else {return}
                    let decoder = JSONDecoder()
                    do {
                        let trendingData  = try decoder.decode(TrendingData.self, from: trendingData)
                        completionHandler(.success(trendingData))
                    } catch let error  {
                        completionHandler(.failure(ApiError.parsing(error as? DecodingError)))
                    }
                }
                else {
                    completionHandler(.failure(ApiError.badResponse(statusCode: response.response!.statusCode)))
                }
            case .failure(_):
                completionHandler(.failure(ApiError.unknown))
            }
        }
    }
    func searchMovie(name:String, completionHandler: @escaping(Result<TrendingData , Error>) -> Void) {
        AF.request(ApiUrls.SEARCH_MOVIES , method: .get , parameters: [
            "api_key": ApiConstants.API_KEY,
            "query":name
        ])
        .validate(statusCode: 200..<500)
        .response { response in
            switch response.result {
            case .success(let data):
                if((200...299).contains(response.response!.statusCode)){
                    guard let trendingData = data else {return}
                    let decoder = JSONDecoder()
                    do {
                        let trendingData  = try decoder.decode(TrendingData.self, from: trendingData)
                        completionHandler(.success(trendingData))
                    } catch let error  {
                        completionHandler(.failure(ApiError.parsing(error as? DecodingError)))
                    }
                }
                else {
                    completionHandler(.failure(ApiError.badResponse(statusCode: response.response!.statusCode)))
                }
            case .failure(_):
                completionHandler(.failure(ApiError.unknown))
            }
        }
    }
}
