//
//  TrendingView.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 12/03/2023.
//

import SwiftUI

struct TrendingView: View {
    var title: String
    var trendindMovies: [TrendingResult]
    var body: some View {
        VStack {
            HStack{
                Text(title)
                    .font(.system(size: 22,weight: .bold,design: .monospaced))
                Spacer()
            }.padding(EdgeInsets.init(top: 0, leading: 0, bottom: 16, trailing: 0))
            ScrollView(.horizontal){
                HStack {
                    ForEach(trendindMovies, id: \.id) { movie in
                        NavigationLink(destination: TmdbDetailsView(movie: movie)) {
                            AsyncImage(url: URL(string: posterUrl(path: movie.poster_path ?? ""))){ image in
                                image
                                    .resizable()
                            } placeholder: {
                                Color.black.opacity(0.1)
                            }
                            .frame(width:UIScreen.main.bounds.width*0.50, height:  UIScreen.main.bounds.height*0.40)
                            .cornerRadius(10)
                        }
                    }
                }
            }
        }.padding(EdgeInsets.init(top: 16, leading: 16, bottom: 16, trailing: 0))
    }
}


