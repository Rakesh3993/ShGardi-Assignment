//
//  PersonBioViewController.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import UIKit

class PersonBioViewController: UIViewController {
    
    var personImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private var dobLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private var dopLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private var descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.text = "Description"
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private var backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.left")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .default))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupView()
        setupConstraints()
    }
    
    @objc func backButtonPressed() {
        self.dismiss(animated: true)
    }

    
    func setupView() {
        view.addSubview(backButton)
        view.addSubview(personImage)
        view.addSubview(nameLabel)
        view.addSubview(dobLabel)
        view.addSubview(dopLabel)
        view.addSubview(descriptionText)
        view.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            personImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            personImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            personImage.widthAnchor.constraint(equalToConstant: 150),
            personImage.heightAnchor.constraint(equalToConstant: 250),
            
            nameLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            dopLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 20),
            dopLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            
            dobLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 20),
            dobLabel.topAnchor.constraint(equalTo: dopLabel.bottomAnchor, constant: 30),
            
            descriptionText.topAnchor.constraint(equalTo: personImage.bottomAnchor),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionText.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with model: PersonBioModel) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.profile_path ?? "")") else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let uiimage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.personImage.image = uiimage
            }
        }.resume()
        
        nameLabel.text = model.name ?? "NO Name Avail"
        dopLabel.text = model.place_of_birth ?? ""
        dobLabel.text = model.birthday ?? ""
        descriptionLabel.text = model.biography
    }
}
