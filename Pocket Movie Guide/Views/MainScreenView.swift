//
//  MainScreenView.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 22/09/21.
//

import UIKit

final class MainScreenView: UIView {
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = K.BrandColors.darkBlue
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainScreenView: CodeView {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = K.BrandColors.darkBlue
    }
}
