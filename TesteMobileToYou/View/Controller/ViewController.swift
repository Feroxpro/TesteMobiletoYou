//
//  ViewController.swift
//  TesteMobileToYou
//
//  Created by Felipe Domingos on 01/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var viewModel: MoviesViewModel = {
        let vm = MoviesViewModel(viewController: self)
        return vm
    }()
    
    var dataTitle: MoviesModel?
    var dataSimilar: [Results] = []
    var detailsView = DetailsView()
    var titleTable = TitleTableViewCell()
    
    override func loadView(){
        self.view = self.detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailsView.configTableViewProtocols(delegate: self, dataSource: self)
        view.backgroundColor = .black
        self.viewModel.validateSimilar() { similar in
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setData(data: Similar) {
        dataSimilar = data.results
        detailsView.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSimilar.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row <= 0 {
            let titleCell: TitleTableViewCell? = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.indentifier, for: indexPath) as? TitleTableViewCell
            let selectedIndex = indexPath
            if selectedIndex == indexPath {titleCell?.backgroundColor = .black}
            self.viewModel.validateMovies() { movie in
                titleCell?.addData(data: movie)
                self.detailsView.addDataImage(data: movie)
                
            }
            
            
            return titleCell ?? UITableViewCell()
        } else {
            let similarCell: SimilarTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SimilarTableViewCell.indentifier, for: indexPath) as? SimilarTableViewCell
            let selectedIndex = indexPath
            if selectedIndex == indexPath {similarCell?.backgroundColor = .black}
            similarCell?.addDataTable(data: dataSimilar [indexPath.row])
            return similarCell ?? UITableViewCell()
            
            //16 rows
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row <= 0 {
            return 120
        } else {
            return 100
        }
    }
}
