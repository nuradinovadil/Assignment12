//
//  PlacesTableViewCell.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 29/01/23.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    private lazy var imageOfCinemas: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameOfCinemas: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var addressesOfCinemas: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(with string: String) {
        nameOfCinemas.text = string
    }
    func setImage(with string: String) {
        imageOfCinemas.image = UIImage(named: string)
    }
    
    func setAddress(with string: String){
        addressesOfCinemas.text = string
    }
    
    func configure(with model: MovieModel){
        guard let url = URL(string: "\(Constants.Links.imageUrl)\(model.posterPath)") else { fatalError("Incorrect link to Poster path!")
        }
        let stringGenres = model.genreIds.map { String($0)}
         DispatchQueue.main.async {
            self.imageOfCinemas.kf.setImage(with: url)
             self.nameOfCinemas.text = model.title
             self.addressesOfCinemas.text = stringGenres.joined(separator: ", ")
        }
    }
    
}

private extension PlacesTableViewCell {
    func setupViews() {
        contentView.addSubview(imageOfCinemas)
        contentView.addSubview(nameOfCinemas)
        contentView.addSubview(addressesOfCinemas)
        
    }
    func setupConstraints() {
        imageOfCinemas.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(5)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
        nameOfCinemas.snp.makeConstraints { make in
            make.leading.equalTo(imageOfCinemas.snp.trailing).offset(10)
            make.top.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.30)
        }
        
        addressesOfCinemas.snp.makeConstraints { make in
            make.top.equalTo(nameOfCinemas.snp.bottom)
            make.leading.equalTo(imageOfCinemas.snp.trailing).offset(10)
            make.trailing.bottom.equalToSuperview()
        }
    }
}
