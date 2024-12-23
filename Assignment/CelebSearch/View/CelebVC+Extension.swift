//
//  CelebVC+Extension.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import UIKit

extension CelebViewController: APICallerDelegate {
    func fetchPopularPerson(with list: [PersonResults], fromSearch: Bool) {
        if fromSearch {
            self.personList = list
        } else {
            isLoading = false
            if currentPage == 1 {
                self.personList = list
            } else {
                self.personList.append(contentsOf: list)
            }
        }
    }
}

extension CelebViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = personList[indexPath.row]
        cell.backgroundColor = .white
        cell.textLabel?.text = data.name ?? ""
        cell.textLabel?.textColor = .black
        
        let chevronButton = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.right")?
            .withRenderingMode(.alwaysTemplate)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 15, weight: .regular, scale: .default))
        chevronButton.setImage(image, for: .normal)
        chevronButton.tintColor = .white
        chevronButton.backgroundColor = .gray
        chevronButton.layer.cornerRadius = 12.5
        chevronButton.isUserInteractionEnabled = false
        chevronButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        cell.accessoryView = chevronButton
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let currentOffset = scrollView.contentOffset.y
        let frameHeight = scrollView.frame.size.height
        let threshold: CGFloat = 50
        
        if contentHeight - currentOffset <= frameHeight + threshold {
            loadNextPageIfNeeded()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personData = personList[indexPath.row]
        apiCaller.personProfileData(id: personData.id ?? 0) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
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
}

extension CelebViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty, query.trimmingCharacters(in: .whitespaces).count >= 3, let resultController = searchController.searchResultsController as? PersonSearchResultViewController else { return }
        apiCaller.searchCelebData(query: query)
        resultController.configure(with: self.personList)
    }
}
