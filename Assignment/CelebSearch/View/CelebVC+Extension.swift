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
            
        for item in personList {
            print(item.id ?? "", item.name ?? "")
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
        cell.textLabel?.text = data.name ?? ""
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
        return 130
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
