//
//  MovieCollectionViewCell.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 28/09/21.
//

import UIKit
import SnapKit

class MovieCollectionViewCell: UICollectionViewCell {
    
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
    
    
    // Configurações adicionais da Label para ficar melhor ajustada
    func configureTitleLabel() {
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    
    // Função para que seja passado um modelo de "Movie" e configurar o label desse filme e posteriormente a imagem que virá junto. (Muito importante  no momento de criar TableViews e CollectionViews de forma programática.)
    public func configure(with movie: Movie) {
        self.movieTitleLabel.text = movie.title
    }
    
}


extension MovieCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(movieTitleLabel)
    }
    
    func setupConstraints() {
        movieTitleLabel.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview().offset(5)
        }
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .systemRed
    }
    
    
}
