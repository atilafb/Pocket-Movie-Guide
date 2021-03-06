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
        view.contentMode = .scaleToFill
        return view
    }()
    
    lazy var movieTitleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.backgroundColor = .lightGray
        view.textAlignment = .center
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureTitleLabel()
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configurações adicionais da ImageView para ficar melhor ajustada
    func configureImageView() {
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
    }
    
    // Configurações adicionais da Label para ficar melhor ajustada
    func configureTitleLabel() {
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        movieTitleLabel.layer.cornerRadius = 5
        movieTitleLabel.clipsToBounds = true
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
            make.height.equalToSuperview().multipliedBy(0.85)
        }
        
        movieTitleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(2)
            make.top.equalTo(imageView.snp.bottom).offset(4)
        }
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .white
        
        // Colocando bordas arrendondas na célula
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        // Masks to bounds como falso caso seja necessário alguma configuração extra. Retirar se não for necessário
        layer.cornerRadius = 10
        layer.masksToBounds = false
    }
    
}
