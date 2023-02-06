//
//  TrendingCollectionViewCell.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 28/01/23.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    private lazy var trendingImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cofigure(with backdropPath: String) {
        guard let url = URL(string: "\(Constants.Links.imageUrl)\(backdropPath)") else { fatalError("Incorrect link!")}
        DispatchQueue.main.async {
            self.trendingImageView.kf.setImage(with: url)
        }
    }
}

private extension TrendingCollectionViewCell{
    
    func setupViews(){
        contentView.addSubview(trendingImageView)
    }
    
    func setupConstraints(){
        trendingImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
