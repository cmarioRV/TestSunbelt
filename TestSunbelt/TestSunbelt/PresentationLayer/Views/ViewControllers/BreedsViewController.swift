//
//  BreedsViewController.swift
//  TestSunbelt
//
//  Created by Mario Rúa on 1/09/20.
//  Copyright © 2020 Mario Rúa. All rights reserved.
//

import Foundation
import UIKit

protocol BreedsViewControllerDelegate: class {
    func cellSelected(name: String)
}

class BreedsViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    
    private var viewModel: BreedsViewModelType
    weak var delegate: BreedsViewControllerDelegate?
    
    init(_ viewModel: BreedsViewModelType) {
        self.viewModel = viewModel
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
        viewModel.inputs.getBreeds()
    }
    
    private func setupViews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.text = "Categorías"
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(BreedCell.self, forCellReuseIdentifier: BreedCell.cellIdentifier())
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
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
        
        viewModel.outputs.cellViewModels.bind({ [weak self] (cellViewModels) in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        })
    }
}

extension BreedsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.cellViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowViewModel = viewModel.outputs.cellViewModels.value[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(for: rowViewModel), for: indexPath)

        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.cellSelected(name: viewModel.outputs.cellViewModels.value[indexPath.row].name)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func cellIdentifier(for viewModel: CellViewModel) -> String {
        switch viewModel {
        case is BreedCellViewModel:
            return BreedCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
}
