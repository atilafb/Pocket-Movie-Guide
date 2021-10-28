//
//  MainVC.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 22/09/21.
//

import UIKit

class MainVC: UIViewController {
    
    let screen = MainScreenView()
    let searchController = UISearchController()
    var movieManager = MovieManager()
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
        
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupSearchBar()
    }
    
    func setupSearchBar () {
        // Chamando os delegates da searchBar na função de configurar
        setSearchControllerDelegates()
        
        // setup da navigationBar
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.barTintColor = K.BrandColors.darkBlue
        }
        
        // setup da searchBar
        searchController.searchBar.backgroundColor = K.BrandColors.darkBlue
        searchController.searchBar.tintColor = .white
        
        // Setup do textField da searchController.searchBar
        if let searchField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            
            // searchBar.searchField placeholder
            let placeholderString = NSAttributedString(string: "placeholder", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            searchField.attributedPlaceholder = placeholderString
            
            //searchBar.searchField setup
            searchController.searchBar.searchTextField.backgroundColor = .white
        }
        
        navigationItem.searchController = searchController
    }
    
    func setSearchControllerDelegates() {
        searchController.searchBar.delegate = self
    }
    
    func configureTableView() {
        // Chamando os delegates da tableView na função de configurar
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

//MARK: - UITableViewDelegate and DataSource

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

//MARK: - UISearchBarDelegate

extension MainVC: UISearchBarDelegate {
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        if searchBar.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let movie = searchBar.text {
            movieManager.getMovieByName(for: movie)
        }
        
        searchBar.text = ""
    }
    
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
