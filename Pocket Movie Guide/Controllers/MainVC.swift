//
//  MainVC.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 22/09/21.
//

import UIKit

class MainVC: UIViewController {
    
    let screen = MainScreenView()
    
    override func loadView() {
        self.view = screen
        navigationController?.navigationBar.largeTitleTextAttributes = K.BrandColors.titleColor
        title = "Pocket Movie Guide"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        setTableViewDelegates()
        //row height
        screen.tableView.rowHeight = 100
        //register cell
    }
    
    func setTableViewDelegates() {
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
