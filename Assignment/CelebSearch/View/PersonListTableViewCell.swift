//
//  PersonListTableViewCell.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import UIKit

class PersonListTableViewCell: UITableViewCell {
        
    var personImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(personImage)
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            personImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            personImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            personImage.widthAnchor.constraint(equalToConstant: 80),
            personImage.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(with model: PersonResults) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.profile_path ?? "")") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let uiimage = UIImage(data: data) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.personImage.image = uiimage
            }
        }.resume()
        nameLabel.text = model.name
    }
}
