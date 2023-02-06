//
//  PlaceViewController.swift
//  KinoKz
//
//  Created by Nuradinov Adil on 26/01/23.
//

import UIKit
import SnapKit

final class PlaceViewController: UIViewController {

    var apiCaller = APICaller()
    var movieList: [MovieModel] = []
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let categoryList = Category.allCases
    
    private let cinemaListTwo = Constants.Values.cinemas
    private let cinemaImages = Constants.Values.images
    private let cinemaAdresses = Constants.Values.addresses
    
    private lazy var searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Поиск кинотеатров, театров и залов"
        return searchBar
    }()
    
    private lazy var placesCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
        return collectionView
    }()
    
    
    private lazy var placesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlacesTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.placesTableViewCell)
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiCaller.delegate = self
        apiCaller.fetchRequest()

        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        
        placesCollectionView.dataSource = self
        placesCollectionView.delegate = self
        placesTableView.dataSource = self
        placesTableView.delegate = self
    }
    
}

extension PlaceViewController : APICallerDelegate {
    func didUPdateMovieList(with movieList: [MovieModel]) {
        self.movieList = movieList
        DispatchQueue.main.async {
            self.placesTableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print("Failed with error!!!", error)
    }
}

extension PlaceViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
        cell.cofigure(with: categoryList[indexPath.row].rawValue)
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 7
        cell.clipsToBounds = true
        return cell
    }
}

extension PlaceViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = categoryList[indexPath.row].rawValue
        label.sizeToFit()
        return CGSize(width: label.frame.size.width + 20, height: collectionView.frame.size.height - 10)
    }
}

extension PlaceViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.placesTableViewCell, for: indexPath) as! PlacesTableViewCell
        cell.configure(with: movieList[indexPath.row])
        return cell
    }
}

extension PlaceViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
}

private extension PlaceViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(searchBar)
        contentView.addSubview(placesCollectionView)
        contentView.addSubview(placesTableView)
        
    }
    
    func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.05)
        }
        placesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.05)
        }
        placesTableView.snp.makeConstraints { make in
            make.top.equalTo(placesCollectionView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(view).multipliedBy(2.5)
        }
        
    }
}
