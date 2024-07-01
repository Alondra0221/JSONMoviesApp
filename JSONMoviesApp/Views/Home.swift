//
//  Home.swift
//  JSONMoviesApp
//
//  Created by Alondra García Morales on 14/06/24.
//

import SwiftUI

struct Home: View {
    
    @State private var search = ""
    
    //@State private var buscar = false
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(.white)]
    }
    
    
        var body: some View {
        NavigationStack{
            ZStack{
                BackgroundGradient()
                VStack{
                    GenreView().padding(.top, -40)
                    DiscoverView().padding(.top, -90)
                }.padding(.all)
                ZStack{
                    VStack(){
                        HStack(spacing: 10){
                            TextField("", text: $search, prompt: Text("Search a movie"))
                            Buttons(search: search)
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.leading, 10)
                        .padding(.trailing,10)
                        .background(.white.opacity(1))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        Spacer()
                    }.padding(.all)
                        .navigationTitle("Movie")
                }
                
                    
               

            }
            
        }
    }
}


#Preview{
    Home()
}
