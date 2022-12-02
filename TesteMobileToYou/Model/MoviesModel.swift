//
//  MoviesModel.swift
//  TesteMobileToYou
//
//  Created by Felipe Domingos on 01/12/22.
//

import Foundation


struct MoviesModel: Codable {
    
    let title: String?
    let popularity: Double?
    var vote_count: Double?
    var poster_path: String?
}
