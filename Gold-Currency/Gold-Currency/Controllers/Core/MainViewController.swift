//
//  MainViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 22/12/2022.
//

import UIKit

class MainViewController: UIViewController {
    

    private var metals:[Metal]?
    private let Price_Gram_18_Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "Price Gram 18: "
//        label.backgroundColor = .red
        return label
    }()
    
    private let Price_Gram_18_Label_value: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "value"
//        label.backgroundColor = .blue
        return label
    }()
    
    private let Price_Gram_20_Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "Price Gram 20: "
//        label.backgroundColor = .red
        return label
    }()
    
    private let Price_Gram_20_Label_value: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "value"
//        label.backgroundColor = .red
        return label
    }()
    
    private let Price_Gram_21_Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "Price Gram 21: "
//        label.backgroundColor = .red
        return label
    }()
    
    private let Price_Gram_21_Label_value: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "value"
//        label.backgroundColor = .red
        return label
    }()
    
    private let Price_Gram_22_Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "Price Gram 22: "
//        label.backgroundColor = .red
        return label
    }()
    
    private let Price_Gram_22_Label_value: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "value"
//        label.backgroundColor = .red
        return label
    }()
    
    private let Price_Gram_24_Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "Price Gram 24: "
//        label.backgroundColor = .red
        return label
    }()
    
    private let Price_Gram_24_Label_value: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "value"
//        label.backgroundColor = .red
        return label
    }()
    
    
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .systemBackground
        
        title = "Gold Prices"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(Price_Gram_18_Label)
        view.addSubview(Price_Gram_18_Label_value)
        view.addSubview(Price_Gram_20_Label)
        view.addSubview(Price_Gram_20_Label_value)
        view.addSubview(Price_Gram_21_Label)
        view.addSubview(Price_Gram_21_Label_value)
        view.addSubview(Price_Gram_22_Label)
        view.addSubview(Price_Gram_22_Label_value)
        view.addSubview(Price_Gram_24_Label)
        view.addSubview(Price_Gram_24_Label_value)
        applyConstraints()
        //fetch data
        fetchMetalPrices()
    }
    

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    private func applyConstraints()
    {
        let Price_Gram_18_Label_Constraints = [
            Price_Gram_18_Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 175),
            Price_Gram_18_Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            Price_Gram_18_Label.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_18_Label.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        let Price_Gram_18_Label_value_Constraints = [
            Price_Gram_18_Label_value.topAnchor.constraint(equalTo: view.topAnchor, constant: 175),
            Price_Gram_18_Label_value.leadingAnchor.constraint(equalTo: Price_Gram_18_Label.trailingAnchor, constant: 25),
            Price_Gram_18_Label_value.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_18_Label_value.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        let Price_Gram_20_Label_Constraints = [
            Price_Gram_20_Label.topAnchor.constraint(equalTo: Price_Gram_18_Label.bottomAnchor, constant: 20),
            Price_Gram_20_Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            Price_Gram_20_Label.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_20_Label.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        let Price_Gram_20_Label_value_Constraints = [
            Price_Gram_20_Label_value.topAnchor.constraint(equalTo: Price_Gram_18_Label.bottomAnchor, constant: 20),
            Price_Gram_20_Label_value.leadingAnchor.constraint(equalTo: Price_Gram_20_Label.trailingAnchor, constant: 25),
            Price_Gram_20_Label_value.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_20_Label_value.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        
        let Price_Gram_21_Label_Constraints = [
            Price_Gram_21_Label.topAnchor.constraint(equalTo: Price_Gram_20_Label.bottomAnchor, constant: 20),
            Price_Gram_21_Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            Price_Gram_21_Label.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_21_Label.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        let Price_Gram_21_Label_value_Constraints = [
            Price_Gram_21_Label_value.topAnchor.constraint(equalTo: Price_Gram_20_Label.bottomAnchor, constant: 20),
            Price_Gram_21_Label_value.leadingAnchor.constraint(equalTo: Price_Gram_21_Label.trailingAnchor, constant: 25),
            Price_Gram_21_Label_value.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_21_Label_value.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        let Price_Gram_22_Label_Constraints = [
            Price_Gram_22_Label.topAnchor.constraint(equalTo: Price_Gram_21_Label.bottomAnchor, constant: 20),
            Price_Gram_22_Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            Price_Gram_22_Label.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_22_Label.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        let Price_Gram_22_Label_value_Constraints = [
            Price_Gram_22_Label_value.topAnchor.constraint(equalTo: Price_Gram_21_Label.bottomAnchor, constant: 20),
            Price_Gram_22_Label_value.leadingAnchor.constraint(equalTo: Price_Gram_22_Label.trailingAnchor, constant: 25),
            Price_Gram_22_Label_value.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_22_Label_value.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        let Price_Gram_24_Label_Constraints = [
            Price_Gram_24_Label.topAnchor.constraint(equalTo: Price_Gram_22_Label.bottomAnchor, constant: 20),
            Price_Gram_24_Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            Price_Gram_24_Label.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_24_Label.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        
        let Price_Gram_24_Label_value_Constraints = [
            Price_Gram_24_Label_value.topAnchor.constraint(equalTo: Price_Gram_22_Label.bottomAnchor, constant: 20),
            Price_Gram_24_Label_value.leadingAnchor.constraint(equalTo: Price_Gram_24_Label.trailingAnchor, constant: 25),
            Price_Gram_24_Label_value.widthAnchor.constraint(equalToConstant: 150),
            Price_Gram_24_Label_value.heightAnchor.constraint(equalToConstant: 80),
           
        ]
        
        NSLayoutConstraint.activate(Price_Gram_18_Label_Constraints)
        NSLayoutConstraint.activate(Price_Gram_18_Label_value_Constraints)
        NSLayoutConstraint.activate(Price_Gram_20_Label_Constraints)
        NSLayoutConstraint.activate(Price_Gram_20_Label_value_Constraints)
        NSLayoutConstraint.activate(Price_Gram_21_Label_Constraints)
        NSLayoutConstraint.activate(Price_Gram_21_Label_value_Constraints)
        NSLayoutConstraint.activate(Price_Gram_22_Label_Constraints)
        NSLayoutConstraint.activate(Price_Gram_22_Label_value_Constraints)
        NSLayoutConstraint.activate(Price_Gram_24_Label_Constraints)
        NSLayoutConstraint.activate(Price_Gram_24_Label_value_Constraints)
      
    }
    
    private func fetchMetalPrices()
    {
        APICaller.shared.getPrices{[weak self] results in
            
            switch results {
            case .success(let metal):
                self?.metals = metal
                DispatchQueue.main.async {
                    self?.Price_Gram_18_Label_value.text = String(self?.metals?[0].price_gram_18k ?? 0.0)
                    self?.Price_Gram_20_Label_value.text = String(self?.metals?[0].price_gram_20k ?? 0.0)
                    self?.Price_Gram_21_Label_value.text = String(self?.metals?[0].price_gram_21k ?? 0.0)
                    self?.Price_Gram_22_Label_value.text = String(self?.metals?[0].price_gram_22k ?? 0.0)
                    self?.Price_Gram_24_Label_value.text = String(self?.metals?[0].price_gram_24k ?? 0.0)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


    
    

