//
//  BreedDetailViewController.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 2/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class BreedDetailViewController: UIViewController {
    
    private let breedImageView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let childFriendlyImageView = UIImageView()
    private let childFriendlyLabel = UILabel()
    private let dogFriendlyLabel = UILabel()
    private let dogFriendlyImageView = UIImageView()
    private let hStackView = UIStackView()
    private let leftStackView = UIStackView()
    private let rightStackView = UIStackView()
    
    private var viewModel: BreedDetailViewModelType
    private var breedName: String
    
    init(_ viewModel: BreedDetailViewModelType, name: String) {
        self.viewModel = viewModel
        self.breedName = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupViews()
        setConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bindViewModel()
        viewModel.inputs.getBreedDetail(name: breedName)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        breedImageView.layer.cornerRadius = 10
        breedImageView.layer.masksToBounds = true
    }
    
    private func setupViews() {
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.alignment = .center
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 0
        
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.alignment = .center
        leftStackView.axis = .vertical
        leftStackView.distribution = .fill
        leftStackView.spacing = 5
        
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.alignment = .center
        rightStackView.axis = .vertical
        rightStackView.distribution = .fill
        rightStackView.spacing = 5
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        nameLabel.numberOfLines = 0
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .justified
        
        childFriendlyLabel.translatesAutoresizingMaskIntoConstraints = false
        childFriendlyLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        childFriendlyLabel.numberOfLines = 0
        
        dogFriendlyLabel.translatesAutoresizingMaskIntoConstraints = false
        dogFriendlyLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        dogFriendlyLabel.numberOfLines = 0
        
        breedImageView.translatesAutoresizingMaskIntoConstraints = false
        breedImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        
        childFriendlyImageView.translatesAutoresizingMaskIntoConstraints = false
        childFriendlyImageView.image = UIImage(named: "childIcon")
        
        dogFriendlyImageView.translatesAutoresizingMaskIntoConstraints = false
        dogFriendlyImageView.image = UIImage(named: "dogIcon")
        
        leftStackView.addArrangedSubview(childFriendlyImageView)
        leftStackView.addArrangedSubview(childFriendlyLabel)
        
        rightStackView.addArrangedSubview(dogFriendlyImageView)
        rightStackView.addArrangedSubview(dogFriendlyLabel)
        
        hStackView.addArrangedSubview(leftStackView)
        hStackView.addArrangedSubview(rightStackView)
        
        view.addSubview(breedImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(hStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            breedImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            breedImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            breedImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            breedImageView.heightAnchor.constraint(equalTo: breedImageView.widthAnchor, multiplier: 0.6, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: breedImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            hStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
        
        childFriendlyImageView.widthAnchor.constraint(equalTo: childFriendlyImageView.heightAnchor, multiplier: 1, constant: 0).isActive = true
        childFriendlyImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dogFriendlyImageView.widthAnchor.constraint(equalTo: dogFriendlyImageView.heightAnchor, multiplier: 1, constant: 0).isActive = true
        dogFriendlyImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func bindViewModel() {
        viewModel.outputs.isBussy.bind({ [weak self] (isBussy) in
            DispatchQueue.main.async {
                if isBussy {
                    self?.showSpinner()
                } else {
                    self?.removeSpinner()
                }
            }
        })
        
        viewModel.outputs.breedDetail.bind { [weak self] (breedDetail) in
            DispatchQueue.main.async {
                guard let breedDetail = breedDetail else { return }
                
                self?.nameLabel.text = breedDetail.name
                self?.descriptionLabel.text = breedDetail.description
                self?.childFriendlyLabel.text = (breedDetail.child_friendly != nil) ? String(breedDetail.child_friendly!) : "N/A"
                self?.dogFriendlyLabel.text = (breedDetail.dog_friendly != nil) ? String(breedDetail.dog_friendly!) : "N/A"
            }
        }
        
        viewModel.outputs.breedUrl.bind { [weak self] (urlString) in
            DispatchQueue.main.async {
                guard let urlString = urlString, let url = URL(string: urlString) else { return }
                
                self?.breedImageView.sd_setImage(with: url, completed: { (image, error, cacheType, url) in
                    DispatchQueue.main.async {
                        if image != nil {
                            self?.breedImageView.image = image
                        } else {
                            self?.breedImageView.image = UIImage(named: "imageNoAvailable")
                        }
                    }
                })
            }
        }
    }
}
