//
//  MoviesViewModel.swift
//  TesteMobileToYou
//
//  Created by Felipe Domingos on 01/12/22.
//

import Foundation


class MoviesViewModel {
    var rest = RestManager()
    
    var viewController: ViewController
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func validateMovies(completion: @escaping (_ movie: MoviesModel) -> Void) {
        rest.movies() { movie in
            completion(movie)
        }
    }
    
    func validateSimilar(completion: @escaping (_ similar: Similar) -> Void) {
        rest.similar() { similar in
            completion(similar)
            self.gotoDetailsTableView(data: similar)
        }
    }
    
    public func gotoDetailsTableView(data: Similar) {
        let controller = ViewController()
        controller.setData(data: data)
        self.viewController.setData(data: data)
        
    }
}
