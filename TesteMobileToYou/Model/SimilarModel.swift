//
//  SimilarModel.swift
//  TesteMobileToYou
//
//  Created by Felipe Domingos on 01/12/22.
//

import Foundation

struct Similar: Codable  {
    
    var results: [Results]
}

struct Results : Codable {
    let title: String?
    let poster_path: String?
    let release_date: String?
}

