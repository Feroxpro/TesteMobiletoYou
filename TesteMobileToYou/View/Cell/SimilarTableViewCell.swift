//
//  otherTableViewCell.swift
//  TesteMobileToYou
//
//  Created by Felipe Domingos on 01/12/22.
//

import UIKit

class SimilarTableViewCell: UITableViewCell {
    
    
    
    static let indentifier:String = "SimilarTableViewCell"
    
    lazy var similarMovieImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.frame.size.height = 20
        image.frame.size.width = 20
        return image
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Code Next-Trial", size: 15)
        label.textColor = .red
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDataTable(data: Results) {
        
        nameLabel.text = data.title
        let baseURL = "https://image.tmdb.org/t/p/"
        let fileSize = "w200"
        guard let imageUrl = data.poster_path else {return}
        similarMovieImage.downloaded(from: "\(baseURL)\(fileSize)\(imageUrl)")
    }
    
    func addSubView() {
        contentView.addSubview(similarMovieImage)
        contentView.addSubview(nameLabel)
        
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            similarMovieImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            similarMovieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            similarMovieImage.heightAnchor.constraint(equalToConstant: 80),
            similarMovieImage.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: similarMovieImage.trailingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 80),
            nameLabel.widthAnchor.constraint(equalToConstant: 300),
        ])
        
    }
}
