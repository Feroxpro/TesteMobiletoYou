//
//  TitleTableViewCell.swift
//  TesteMobileToYou
//
//  Created by Felipe Domingos on 01/12/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let indentifier:String = "TitleTableViewCell"
    
    let detailsView = DetailsView()
    
    lazy var TitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    lazy var tilteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont(name: "Code Next-Trial", size: 25)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    lazy var likeMovieCount: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(systemName: "heart.fill")
        img.tintColor = .white
        img.isHidden = true
        return img
    }()
    
    lazy var unlikeMovieCount: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(systemName: "heart")
        img.tintColor = .white
        return img
    }()
    
    lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var viewMovieCount: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(systemName: "eye")
        img.tintColor = .white
        return img
    }()
    
    lazy var ViewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
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
    
    func addData(data: MoviesModel) {
        let intToDecimal = ((data.vote_count ?? 0) / 100)
        let likeConv = String(format: "%.0f", intToDecimal)
        let viewsConv = String(format: "%.0f", data.popularity ?? 0)
        likesLabel.text = "Likes: \(likeConv)K"
        ViewsLabel.text = "Views: \(viewsConv)K"
        tilteLabel.text = data.title
    }
    
    private func addSubView() {
        addSubview(TitleView)
        addSubview(tilteLabel)
        addSubview(unlikeMovieCount)
        addSubview(likeMovieCount)
        addSubview(likesLabel)
        addSubview(viewMovieCount)
        addSubview(ViewsLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            TitleView.topAnchor.constraint(equalTo: topAnchor),
            TitleView.leftAnchor.constraint(equalTo: leftAnchor),
            TitleView.rightAnchor.constraint(equalTo: rightAnchor),
            TitleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tilteLabel.topAnchor.constraint(equalTo: TitleView.topAnchor, constant: 10),
            tilteLabel.leadingAnchor.constraint(equalTo: TitleView.leadingAnchor, constant: 10),
            tilteLabel.trailingAnchor.constraint(equalTo: TitleView.trailingAnchor, constant: -60),
            
            unlikeMovieCount.bottomAnchor.constraint(equalTo: TitleView.bottomAnchor, constant: -10),
            unlikeMovieCount.leadingAnchor.constraint(equalTo: TitleView.leadingAnchor, constant: 10),
            
            likeMovieCount.bottomAnchor.constraint(equalTo: TitleView.bottomAnchor, constant: -10),
            likeMovieCount.leadingAnchor.constraint(equalTo: TitleView.leadingAnchor, constant: 10),
            
            likesLabel.bottomAnchor.constraint(equalTo: TitleView.bottomAnchor, constant: -10),
            likesLabel.leadingAnchor.constraint(equalTo: unlikeMovieCount.trailingAnchor, constant: 5),
            
            viewMovieCount.bottomAnchor.constraint(equalTo: TitleView.bottomAnchor, constant: -10),
            viewMovieCount.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 30),
            
            ViewsLabel.bottomAnchor.constraint(equalTo: TitleView.bottomAnchor, constant: -10),
            ViewsLabel.leadingAnchor.constraint(equalTo: viewMovieCount.trailingAnchor, constant: 5),
        ])
    }
}
