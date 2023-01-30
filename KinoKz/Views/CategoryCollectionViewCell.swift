//
//  CategoryCollectionViewCell.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 28/01/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private var cellSelected: Bool = false
    
    private lazy var categoryNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .label
        label.textAlignment = .center
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
    
    func cofigure(with text: String){
        categoryNameLabel.text = text
    }
}

private extension CategoryCollectionViewCell {
    func setupViews(){
        contentView.addSubview(categoryNameLabel)
    }
    func setupConstraints(){
        categoryNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
