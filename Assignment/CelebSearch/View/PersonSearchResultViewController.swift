//
//  PersonSearchResultViewController.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import UIKit

class PersonSearchResultViewController: UIViewController {
    
    let apiCaller = APICaller()
        
    private var personList: [PersonResults] = [] {
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

extension PersonSearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultcell", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personData = personList[indexPath.row]
        apiCaller.personProfileData(id: personData.id ?? 0) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    print("Navigating to PersonBioViewController with data: \(data)")
                    let vc = PersonBioViewController()
                    vc.configure(with: data)
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
