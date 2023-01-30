//
//  SectionHeaderView.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 28/01/23.
//

import UIKit

class SectionHeaderView: UIView {

    
    private lazy var categoryLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .label
        return label
    }()
    
    private lazy var allLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .systemOrange
        label.textAlignment = .right
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
    
    func configure(with text: String, number: Int) {
        categoryLabel.text = text
        allLabel.text = "All \(number)"
    }
    
}

private extension SectionHeaderView {
    func setupViews() {
        addSubview(categoryLabel)
        addSubview(allLabel)
    }
    func setupConstraints() {
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        allLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryLabel.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
