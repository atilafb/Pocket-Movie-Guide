//
//  MovieCollectionViewCell.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 28/09/21.
//

import UIKit
import SnapKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    lazy var movieTitleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .center
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configurações adicionais da ImageView para ficar melhor ajustada
    func configureImageView() {
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }
    
    // Configurações adicionais da Label para ficar melhor ajustada
    func configureTitleLabel() {
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    
    // Função para que seja passado um modelo de "Movie" e configurar o label desse filme e posteriormente a imagem que virá junto. (Muito importante  no momento de criar TableViews e CollectionViews de forma programática.)
    public func configure(with movie: Movie) {
        self.imageView.image = movie.image
        self.movieTitleLabel.text = movie.title
    }
    
}

extension MovieCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(movieTitleLabel)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        movieTitleLabel.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(8)
        }
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .white
    }
    
}
