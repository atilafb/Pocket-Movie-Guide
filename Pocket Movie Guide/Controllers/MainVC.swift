//
//  MainVC.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 22/09/21.
//

import UIKit

class MainVC: UIViewController {
    
    let searchController = UISearchController()
    let screen = MainScreenView()
    var movies: [Movie] = []
    
    override func loadView() {
        self.view = screen
        navigationController?.navigationBar.titleTextAttributes = K.BrandColors.titleColor
        title = "Pocket Movie Guide"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Preenchendo o Array com os dados do dummy data. No fim da aplicação deverá ser preenchido com dados da API.
        movies = fetchData()
        
        setupSearchBar()
        configureTableView()
    }
    
    func setupSearchBar () {
        navigationItem.searchController = searchController
    }
    
    func configureTableView() {
        setTableViewDelegates()
        // Hardcodando a altura da TableViewCell e comentando o ajuste dinamico da célula lá embaixo
        screen.tableView.rowHeight = 350
        screen.tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: K.Cells.movieTableViewCell)
    }
    
    func setTableViewDelegates() {
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Criando duas seções (Lançamentos e Populares)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.movieTableViewCell) as! MovieTableViewCell
        cell.set(with: movies)
        
        // Permitindo que o usuário scrolle lateralmente
        cell.contentView.isUserInteractionEnabled = false
        return cell
    }
    
    // titulos das seções
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Lançamentos"
        case 1:
            return "Populares"
        default:
            return nil
        }
    }
    
    // Ajustando automaticamente a altura da célula da tableview
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
}

// Creating dummy data. This data is only being used to test my view. After this should be replaced by the data from the API.
extension MainVC {
    func fetchData() -> [Movie] {
        let movie1 = Movie(image: K.Images.fightClub!, title: "Clube da Luta")
        let movie2 = Movie(image: K.Images.shangChi!, title: "Shang Chi")
        let movie3 = Movie(image: K.Images.suicideSquad!, title: "O Esquadrão Suicida")
        let movie4 = Movie(image: K.Images.venom!, title: "Venom: Tempo de Carnificina")
        
        return [movie1, movie2, movie3, movie4]
    }
}
