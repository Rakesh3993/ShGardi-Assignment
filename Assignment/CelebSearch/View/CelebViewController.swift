//
//  CelebViewController.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import UIKit

class CelebViewController: UIViewController {
    
    var apiCaller = APICaller()
    
    var personList: [PersonResults] = []
    var searchedPersonList: [PersonResults] = []
    
    var currentPage = 1
    var isLoading: Bool = false
    
    var personTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PersonListTableViewCell.self, forCellReuseIdentifier: identifier.personListTableViewCell)
        return table
    }()
    
    private var personSearchResult: UISearchController = {
        let controller = UISearchController(searchResultsController: PersonSearchResultViewController())
        controller.searchBar.placeholder = AppConstants.searchBarPlaceHolderText
        return controller
    }()
    
    lazy var scrollToTopButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray.withAlphaComponent(0.6)
        let image = UIImage(systemName: "arrow.up")?
            .withRenderingMode(.alwaysTemplate)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .thin, scale: .default))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true 
        button.addTarget(self, action: #selector(scrollToTop), for: .touchUpInside)
        return button
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
    }
    
    @objc func scrollToTop() {
        personTableView.setContentOffset(CGPoint(x: 0, y: -90), animated: true)
    }
    
    func setupNavigation() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        title = AppConstants.navTitle
       
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
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(personTableView)
        view.addSubview(scrollToTopButton)
        personTableView.delegate = self
        personTableView.dataSource = self
    }
    
    func setupConstraints() {
        personTableView.pin(to: view)
        
        NSLayoutConstraint.activate([
            scrollToTopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollToTopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            scrollToTopButton.widthAnchor.constraint(equalToConstant: 40),
            scrollToTopButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
