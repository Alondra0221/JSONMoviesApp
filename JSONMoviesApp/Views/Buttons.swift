//
//  Buttons.swift
//  JSONMoviesApp
//
//  Created by Alondra García Morales on 18/06/24.
//

import SwiftUI

struct Buttons: View {
    
    var search = ""
    @State private var buscar = false
    
    var body: some View {
        VStack{
            Button{
                buscar.toggle()
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.black.opacity(0.4))
                    .font(.system(size: 20))
                    
                    
                    
                /*Text("Search")
                    .bold()
                    .frame(width: 280, height: 50)
                    .foregroundStyle(.white)
                    .overlay(Capsule().stroke(Color(.white), lineWidth: 2))*/
            }
            .navigationDestination(isPresented: $buscar){
                MoviesView(movie: search)
            }
        }
        
    }
}


#Preview {
    Buttons()
}
