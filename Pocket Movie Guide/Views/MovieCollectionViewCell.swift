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
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(movieTitleLabel)
        configureTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configurando a label dentro da CollectionViewCell
    override func layoutSubviews() {
        super.layoutSubviews()

        movieTitleLabel.frame = CGRect(x: 5,
                                       y: contentView.frame.size.height-50,
                                       width: contentView.frame.size.width-10,
                                       height: 50)
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
