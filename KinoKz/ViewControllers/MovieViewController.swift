//
//  MovieViewController.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 25/01/23.
//

import UIKit
import SnapKit

final class MovieViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let categotyList = Category.allCases
    
    private lazy var mySearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Поиск фильмов"
        return searchBar
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
    }()
    
    
    private lazy var trendingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    private lazy var categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.categoryTableViewCell)
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    

}

extension MovieViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView{
            return categotyList.count
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
            cell.cofigure(with: categotyList[indexPath.row].rawValue)
            cell.backgroundColor = .systemGray6
            cell.layer.cornerRadius = 7
            cell.clipsToBounds = true
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell, for: indexPath) as! TrendingCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        return cell
    }
    
}

/*extension MovieViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.isSelected = true
    }
}*/

extension MovieViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == categoryCollectionView{
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 17)
            label.text = categotyList[indexPath.row].rawValue
            label.sizeToFit()
            return CGSize(width: label.frame.size.width + 20, height: collectionView.frame.size.height - 10)
        }
        let height = collectionView.frame.size.height
        return CGSize(width: height * 1.75, height: height)
    }
}

extension MovieViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categotyList.count - 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.categoryTableViewCell, for: indexPath) as! CategoryTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionHeaderView()
        view.configure(with: categotyList[section + 1].rawValue, number:6)
        return view
    }
    
}

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.4
    }
}


private extension MovieViewController {
    func setupViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mySearchBar)
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(trendingCollectionView)
        contentView.addSubview(categoryTableView)
    }
    
    func setupConstraints(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        
        mySearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mySearchBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        trendingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.16)
        }
        
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(trendingCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view)
            make.bottom.equalToSuperview()
        }
        
    }
}
