//
//  PersonSearchResultViewController.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import UIKit

class PersonSearchResultViewController: UIViewController {
    
    let apiCaller = APICaller()
        
    var personList: [PersonResults] = [] {
        didSet {
            DispatchQueue.main.async {
                self.personResultTableView.reloadData()
            }
        }
    }
    
    var personResultTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "resultcell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(personResultTableView)
        personResultTableView.delegate = self
        personResultTableView.dataSource = self
    }
    
    private func setupConstraints() {
        personResultTableView.pin(to: view)
    }
    
    func configure(with list: [PersonResults]) {
        personList = list
    }
}
