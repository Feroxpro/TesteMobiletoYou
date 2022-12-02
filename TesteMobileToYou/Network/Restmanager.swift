
//
//  RestManager.swift
//  LikeMovies
//
//  Created by Felipe Domingos on 29/11/22.
//

import Foundation
import Alamofire

class RestManager {
    
    let baseUrl: String = "https://api.themoviedb.org/3/movie/550"
    
    func movies(completion: @escaping (_ movie: MoviesModel) -> Void) {
        let parameters:[String:String] = ["api_key" : "6263d7526c108e4da9b5e22a163248ed"]
        AF.request("\(baseUrl)?",
                   method: .get,
                   parameters: parameters).response { response in
                    if let data = response.data {
                        DispatchQueue.main.async {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .useDefaultKeys
                            guard let movieData = try? decoder.decode(MoviesModel.self, from: data) else { return }
                            completion(movieData)
                        }
                    } else {
                        print(response.error as Any, "DEU ERRO")
                    }
                   }
    }
    func similar(completion: @escaping (_ register: Similar) -> Void) {
        let parameters:[String:String] = ["api_key" : "6263d7526c108e4da9b5e22a163248ed"]
        AF.request("\(baseUrl)/similar?",
                   method: .get,
                   parameters: parameters).response { response in
                    if let data = response.data {
                        DispatchQueue.main.async {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .useDefaultKeys
                            
                            guard let similarData = try? decoder.decode(Similar.self, from: data) else { return }
                            completion(similarData)
                        }
                    } else {
                        print(response.error as Any, "DEU ERRO")
                    }
                   }
    }
}



