//
//  CelebViewController.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import UIKit

class CelebViewController: UIViewController {
    
    var apiCaller = APICaller()
    
    var personList: [PersonResults] = [] {
        didSet {
            DispatchQueue.main.async {
                self.personTableView.reloadData()
            }
        }
    }
    
    var currentPage = 1
    var isLoading: Bool = false
    
    var personTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var personSearchResult: UISearchController = {
        let controller = UISearchController(searchResultsController: PersonSearchResultViewController())
        controller.searchBar.placeholder = "Search actors, directors"
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupView()
        setupConstraints()
        apiCaller.delegate = self
        loadPersonData(page: currentPage)
        navigationItem.searchController = personSearchResult
        personSearchResult.searchResultsUpdater = self
//        definesPresentationContext = true
    }
    
    func setupNavigation() {
        title = "Celebrity"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func loadPersonData(page: Int) {
        guard !isLoading else { return }
        isLoading = true
        apiCaller.getCelebData(pages: page)
    }
    
    func loadNextPageIfNeeded() {
        currentPage += 1
        loadPersonData(page: currentPage)
    }
    
    func setupView() {
        view.addSubview(personTableView)
        personTableView.delegate = self
        personTableView.dataSource = self
    }
    
    func setupConstraints() {
        personTableView.pin(to: view)
    }
}
