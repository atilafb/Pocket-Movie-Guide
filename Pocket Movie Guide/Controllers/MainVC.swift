//
//  MainVC.swift
//  Pocket Movie Guide
//
//  Created by Atila Bastos on 22/09/21.
//

import UIKit

class MainVC: UIViewController {
    
    let screen = MainScreenView()
    var movies: [Movie] = []
    
    override func loadView() {
        self.view = screen
        navigationController?.navigationBar.largeTitleTextAttributes = K.BrandColors.titleColor
        title = "Pocket Movie Guide"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        movies = fetchData()
        configureTableView()
    }
    
    
    func configureTableView() {
        setTableViewDelegates()
        // Register cell
        screen.tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: K.Cells.movieTableViewCell)
    }
    
    func setTableViewDelegates() {
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // Criando duas seções (Lançamentos e Populares)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.movieTableViewCell) as! MovieTableViewCell
        cell.set(with: movies)
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

// Creating dummy data. This data is only being used to test my view. After this should be replaced by the data from the API.
extension MainVC {
    func fetchData() -> [Movie] {
        let movie1 = Movie(title: "Movie 1")
        let movie2 = Movie(title: "Movie 2")
        let movie3 = Movie(title: "Movie 3")
        let movie4 = Movie(title: "Movie 4")
        let movie5 = Movie(title: "Movie 5")
        let movie6 = Movie(title: "Movie 6")
        
        return [movie1, movie2, movie3, movie4, movie5, movie6]
    }
}
