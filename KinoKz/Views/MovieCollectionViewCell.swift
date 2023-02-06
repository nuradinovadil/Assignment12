//
//  MovieCollectionViewCell.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 05/02/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    private let wholeView = UIView()
    private lazy var posterImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "knifes")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var movieNameLable: UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.text = "Knives out 2: Glass onion "
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.sizeToFit()
        return label
    }()
    private lazy var ganreNameLable: UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byCharWrapping
        label.text = "Trailer, detectives"
        label.font = UIFont.systemFont(ofSize: 15)
        label.sizeToFit()
        label.textColor = .systemGray2
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: MovieModel){
        guard let url = URL(string: "\(Constants.Links.imageUrl)\(model.posterPath)") else { fatalError("Incorrect link to Poster path!")
        }
        let stringGenres = model.genreIds.map { String($0)}
         DispatchQueue.main.async {
            self.posterImage.kf.setImage(with: url)
             self.movieNameLable.text = model.title
             self.ganreNameLable.text = stringGenres.joined(separator: ", ")
        }
    }
}

private extension MovieCollectionViewCell {
    func setupViews(){
        contentView.addSubview(wholeView)
        wholeView.addSubview(posterImage)
        wholeView.addSubview(movieNameLable)
        wholeView.addSubview(ganreNameLable)
    }
    func setupConstraints(){
        wholeView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        posterImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        movieNameLable.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        ganreNameLable.snp.makeConstraints { make in
            make.top.equalTo(movieNameLable.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }
}
