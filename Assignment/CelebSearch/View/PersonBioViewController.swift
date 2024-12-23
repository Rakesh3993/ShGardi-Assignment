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
        image.layer.cornerRadius = 75
        image.layer.masksToBounds = true
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private var dobLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private var dobTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.text = "Born:"
        return label
    }()
    
    private var dopLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private var dopTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.text = "Birth Place:"
        return label
    }()
    
    private var descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.text = "About"
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private var backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.left")?
            .withTintColor(.black, renderingMode: .alwaysOriginal)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .default))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var placeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dopTextLabel, dopLabel])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var birthStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dobTextLabel, dobLabel])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        return stack
    }()
    
    
    private lazy var descriptionStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [descriptionText, descriptionLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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
        view.addSubview(birthStack)
        view.addSubview(placeStack)
        view.addSubview(descriptionStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            personImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            personImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            personImage.widthAnchor.constraint(equalToConstant: 150),
            personImage.heightAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 51),
            
            placeStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            placeStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            placeStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            placeStack.heightAnchor.constraint(equalToConstant: 40),
            
            dopTextLabel.leadingAnchor.constraint(equalTo: placeStack.leadingAnchor, constant: 20),
            
            birthStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            birthStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            birthStack.topAnchor.constraint(equalTo: placeStack.bottomAnchor, constant: 2),
            birthStack.heightAnchor.constraint(equalToConstant: 40),
            
            dobTextLabel.leadingAnchor.constraint(equalTo: birthStack.leadingAnchor, constant: 20),
            
            descriptionStack.topAnchor.constraint(equalTo: birthStack.bottomAnchor, constant: 2),
            descriptionStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionStack.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionStack.trailingAnchor, constant: -10)
        ])
    }
    
    func configure(with model: PersonBioModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.profile_path ?? "")") else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let uiimage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.personImage.image = uiimage
            }
        }.resume()
        
        nameLabel.text = model.name ?? "No Name Available"
        dopLabel.text = model.place_of_birth ?? "nil"
        dobLabel.text = model.birthday ?? "nil"
        descriptionLabel.text = model.biography ?? "No description Available for this person"
    }
}
