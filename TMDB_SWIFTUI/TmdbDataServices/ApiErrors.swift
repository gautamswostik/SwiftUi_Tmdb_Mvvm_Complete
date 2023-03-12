//
//  ApiErrors.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 11/03/2023.
//

import Foundation

enum ApiError: Error {
    case badURL
    case badResponse(statusCode:Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "Please check is provided url is right or wrong"
        case .parsing(let error):
            return "Encountered error while decoding \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "Error while processing data \(statusCode)"
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong"
        case .unknown:
            return "Something went wrong"
        }
    }
}
