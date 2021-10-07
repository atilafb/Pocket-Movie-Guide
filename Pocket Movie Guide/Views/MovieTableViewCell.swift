//
//  MovieTableViewCell.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 24/09/21.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    var movies: [Movie] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCollectionView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Similar a configure usado na MovieCollectionViewCell
    func set(with movies: [Movie]) {
        self.movies = movies
        collectionView.reloadData()
    }
    
    
    func configureCollectionView() {
        setCollectionViewDelegates()
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: K.Cells.movieCollectionViewCell)
    }
    
    
    func setCollectionViewDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension MovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Cells.movieCollectionViewCell, for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.width
        let width = collectionView.frame.width
        return CGSize(width: width * 0.5,
                      height: height * 0.8)
    }
    
}

extension MovieTableViewCell: CodeView {
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        collectionView.backgroundColor = K.BrandColors.darkBlue
    }
    
}
