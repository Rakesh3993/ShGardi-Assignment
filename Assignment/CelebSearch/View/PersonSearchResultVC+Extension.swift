//
//  PersonSearchResultVC+Extension.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import UIKit

extension PersonSearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultcell", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
