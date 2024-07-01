//
//  DiscoverView.swift
//  JSONMoviesApp
//
//  Created by Alondra García Morales on 26/06/24.
//

import SwiftUI

struct DiscoverView: View {
    
    @StateObject var movies = MoviesViewModel()
    
    var body: some View {
        VStack{
            HStack() {
                Text("Trending")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                Text("Movies")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.white)
            }.padding(.leading, -165)
                
            
            ScrollView(.horizontal){
                LazyHStack(spacing: 0){
                    ForEach(movies.discoverMovies){ item in
                        ImageView(poster: item.poster_path ?? "")
                            .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1.0 : 0.8)
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                            }
                    }
                }
            }
            
        }.task {
            await movies.fetchDiscover()
        }
    }
}

#Preview{
    DiscoverView()
}

struct ImageView : View {
    
    var poster : String
    
    
    var body : some View {
        
        VStack(){
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200/\(poster)")) {image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 360)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding(.horizontal, 4)
                    
            } placeholder: {
                Image("notFound")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 360)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding(.horizontal, 4)
            }
            
        }.padding(.all)
           
    }
}



