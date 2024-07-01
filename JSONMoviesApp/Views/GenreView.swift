//
//  GenreView.swift
//  JSONMoviesApp
//
//  Created by Alondra García Morales on 28/06/24.
//

import SwiftUI

struct GenreView: View {
    
    @StateObject var movies = MoviesViewModel()
    
    let iconDictionary: [String: String] = [
        "Action": "action",
        "Comedy": "comedy50",
        "Crime" : "horror",
        "Drama" : "drama",
        "Horror": "crime",
        "Family": "family"
    ]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack(spacing: 13){
                ForEach(iconDictionary.keys.sorted(), id: \.self){ key in
                    if let iconName = iconDictionary[key] {
                            genView(genre: key, iconName: iconName)
                    }
                        
                }
            }
        }
    }
}

#Preview {
    GenreView()
}

struct genView : View {
    
    let genre: String
    let iconName: String
    
    var body : some View {
        VStack {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                    
            Text(genre)
                .foregroundColor(.white)
                .font(.headline)
        }
        .frame(width: 80, height: 80)
    }
}
