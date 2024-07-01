//
//  MoviesViewModel .swift
//  JSONMoviesApp
//
//  Created by Alondra García Morales on 25/06/24.
//

import Foundation

@MainActor
class MoviesViewModel : ObservableObject{
    
    @Published var dataMovies : [Result] = []
    @Published var discoverMovies : [DiscoverResult] = []
    @Published var titulo = ""
    @Published var movieId = 0
    @Published var show = false
    @Published var key = ""
    
    func fetch(movie:String) async {
        do{
            let urlString = "https://api.themoviedb.org/3/search/movie?api_key=9f37293b5bd05e3fb08040f5f554037f&language=en-US&query=\(movie)&page=1&include_adult=false"
            
            guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let json = try JSONDecoder().decode(Movies.self, from: data)
            self.dataMovies = json.results
           
        }catch let error as NSError{
            print("API Error", error.localizedDescription)
        }
    }
    
    func fetchVideo() async {
        do{
            let urlString = "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=9f37293b5bd05e3fb08040f5f554037f&language=en-US"
            
            guard let url = URL(string: urlString) else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(videoModel.self, from: data)
            let res = json.results.filter({$0.type.contains("Trailer")})
            self.key = res.first?.key ?? ""
            
        } catch let error as NSError{
            print("API Error Video", error.localizedDescription)
        }
    }
    
    func sendItem(item : Result){
        titulo = item.original_title
        movieId = item.id
        show.toggle()
    }
    
    func fetchDiscover() async {
        do{
            let urlString = "https://api.themoviedb.org/3/discover/movie?api_key=9f37293b5bd05e3fb08040f5f554037f&language=en-US&query=batman&page=1&include_adult=false"
            guard let url = URL(string: urlString) else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(DiscoverMovies.self, from: data)
            self.discoverMovies = json.results
            
            
            
        } catch let error as NSError{
            print("API Error Discover", error.localizedDescription)
        }
    }
}
