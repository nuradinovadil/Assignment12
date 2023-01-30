//
//  CategoryTableViewCell.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 28/01/23.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CategoryTableViewCell{
    func setupViews(){
        
    }
    func setupConstraints(){
        
    }
}
