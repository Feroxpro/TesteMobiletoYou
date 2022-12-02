//
//  DetailsView.swift
//  TesteMobileToYou
//
//  Created by Felipe Domingos on 01/12/22.
//

import UIKit


class DetailsView: UIView {

    
    let scrollView: UIScrollView = {
        let Scroll = UIScrollView()
        Scroll.translatesAutoresizingMaskIntoConstraints = false
        Scroll.widthAnchor.constraint(equalToConstant: 500).isActive = true
        return Scroll
    }()
    
    lazy var scrollStackViewContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack .translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var imageMovie: UIImageView = {
        let img = UIImageView()
        img.heightAnchor.constraint(equalToConstant: 400).isActive = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .white
        return img
    }()
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.addBlurToView()
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isUserInteractionEnabled = false
        tableView.isScrollEnabled = false
        tableView.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.indentifier)
        tableView.register(SimilarTableViewCell.self, forCellReuseIdentifier: SimilarTableViewCell.indentifier)
        return tableView
    }()
    
    lazy var likeMovie: UIButton = {
       let btn = UIButton()
        let imageView = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFill
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.tintColor = .red
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(self.actionLikeButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var UnlikeMovie: UIButton = {
       let btn = UIButton()
        let imageView = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFill
        btn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        btn.tintColor = .red
        btn.isUserInteractionEnabled = true
        btn.isHidden = true
        btn.addTarget(self, action: #selector(self.actionUnlikeButton), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubViews()
        self.setupConstraints()
        
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func actionLikeButton() {
        UnlikeMovie.isHidden = false
        likeMovie.isHidden = true
    }

    @objc func actionUnlikeButton() {
        UnlikeMovie.isHidden = true
        likeMovie.isHidden = false
    }
    
    func addDataImage(data: MoviesModel) {
        let baseURL = "https://image.tmdb.org/t/p/"
        let fileSize = "w500"
        guard let imageUrl = data.poster_path else {return}
        imageMovie.downloaded(from: "\(baseURL)\(fileSize)\(imageUrl)")
    }
    private func configSubViews() {
        self.addSubview(scrollView)
        scrollView.addSubview(tableView)
        scrollView.addSubview(imageMovie)
        scrollView.addSubview(scrollStackViewContainer)
        scrollView.addSubview(shadowView)
        scrollView.addSubview(likeMovie)
        scrollView.addSubview(UnlikeMovie)
    }
    
    private func setupConstraints() {
        
        let margins = layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageMovie.topAnchor.constraint(equalTo: self.topAnchor, constant: -30),
            imageMovie.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageMovie.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            imageMovie.bottomAnchor.constraint(equalTo: self.tableView.topAnchor, constant: -30),
            
            shadowView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 200),
            shadowView.leftAnchor.constraint(equalTo: self.leftAnchor),
            shadowView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 300),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            likeMovie.topAnchor.constraint(equalTo: self.tableView.topAnchor, constant: 10),
            likeMovie.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor, constant: -10),
            
            UnlikeMovie.topAnchor.constraint(equalTo: self.tableView.topAnchor, constant: 10),
            UnlikeMovie.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor, constant: -10)
            
        ])
        configureContainerView()
    }
    
    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(shadowView)
        scrollStackViewContainer.addArrangedSubview(tableView)
        
    }
}
