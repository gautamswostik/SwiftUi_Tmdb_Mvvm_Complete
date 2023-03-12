//
//  TmdbDetailsView.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 12/03/2023.
//

import SwiftUI

struct TmdbDetailsView: View {
    var movie: TrendingResult
    var body: some View {
        NavigationView{
            ScrollView {
                ZStack {
                    AsyncImage(url: URL(string: posterUrl(path: movie.poster_path ?? ""))) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .overlay(Material.ultraThin)
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }
                    .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height*0.60)
                    
                    AsyncImage(url: URL(string: posterUrl(path: movie.poster_path ?? ""))){ image in
                        image
                            .resizable()
                    } placeholder: {
                        Color.black.opacity(0.1)
                    }
                    .frame(width:UIScreen.main.bounds.width*0.80, height:  UIScreen.main.bounds.height*0.60)
                    .cornerRadius(20)
                }.padding(.bottom , 40)
                VStack {
                    HStack{
                        Text("Overview")
                            .font(.system(size: 22,weight: .bold,design: .monospaced))
                        Spacer()
                    }.padding(EdgeInsets.init(top: 0, leading: 0, bottom: 16, trailing: 0))
                    Text(movie.overview ?? "")
                }.padding(.horizontal , 16)
            }.padding(.top)
        }.navigationTitle(pageTitle(movie: movie))
    }
}

func pageTitle(movie: TrendingResult) -> String {
    if movie.title != nil{
        return movie.title ?? ""
    }
    return movie.name ?? ""
}
