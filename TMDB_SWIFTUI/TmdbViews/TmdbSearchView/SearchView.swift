//
//  SearchView.swift
//  TMDB_SWIFTUI
//
//  Created by swostik gautam on 12/03/2023.
//

import SwiftUI

struct SearchView: View {
    var trendingViewModel:TrendingViewModel
    @State private var name:String = String()
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Text("Search Movies")
                        .font(.system(size: 32,weight: .bold,design: .monospaced))
                    Spacer()
                }.padding(.vertical , 10)
                TextField("Enter Movie Name", text: $name)
                    .onChange(of: name, perform: { newValue in
                        trendingViewModel.searchMovies(name: newValue)
                    })
                    .textFieldStyle(.roundedBorder)
                    .border(Color.black)
                ScrollView {
                    ForEach(trendingViewModel.searchedMovies.results ?? [], id: \.id) { movie in
                        NavigationLink(destination: TmdbDetailsView(movie: movie))
                        {
                            HStack(alignment: .top) {
                                AsyncImage(url: URL(string: posterUrl(path: movie.poster_path ?? ""))){ image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    Color.black.opacity(0.1)
                                }
                                .frame(width:UIScreen.main.bounds.width*0.50, height:  UIScreen.main.bounds.height*0.40)
                                .cornerRadius(10)
                                .padding(.horizontal , 16)
                                VStack (alignment:.leading){
                                    Text(movie.title ?? "")
                                        .font(.system(size: 20,weight: .bold,design: .monospaced))
                                    Text(movie.overview ?? "")
                                        .font(.system(size: 16,design: .serif))
                                }
                            }
                            .padding(.vertical , 10)
                        } .buttonStyle(PlainButtonStyle())                    }
                }
                    
                Spacer()
            }.padding(.horizontal , 16)
        }
    }
}

