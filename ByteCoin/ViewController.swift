//
//  ViewController.swift
//  ByteCoin
//
//  Created by Сазонов Станислав on 12.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.alignment = .center
        element.spacing = 10
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "ByteCoin"
        element.font = .systemFont(ofSize: 50)
        element.textAlignment = .center
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var coinView: UIView = {
        let element = UIView()
        element.backgroundColor = .red
        
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var coinStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 10
        element.alignment = .center
        element.distribution = .fillEqually
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var imageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: "bitcoinsign.circle.fill")
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bitcoinPriceLabel: UILabel = {
        let element = UILabel()
        element.text = "100"
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var currencyLabel: UILabel = {
        let element = UILabel()
        element.text = "USD"
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var pickerView: UIPickerView = {
        let element = UIPickerView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        setViews()
        setConstraints()
    }
    
    // MARK: - Set Views and Set Constraints
    
    private func setViews() {
        
        view.addSubview(mainStackView)
       
        
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(coinView)
        
        coinView.addSubview(coinStackView)
        
        coinStackView.addArrangedSubview(imageView)
        coinStackView.addArrangedSubview(bitcoinPriceLabel)
        coinStackView.addArrangedSubview(currencyLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            coinView.widthAnchor.constraint(equalToConstant: 300),
            coinView.heightAnchor.constraint(equalToConstant: 50),
            
            coinStackView.topAnchor.constraint(equalTo: coinView.topAnchor),
            coinView.bottomAnchor.constraint(equalTo: coinView.topAnchor),
            coinStackView.leadingAnchor.constraint(equalTo: coinView.leadingAnchor),
            coinStackView.trailingAnchor.constraint(equalTo: coinView.trailingAnchor),
            
            
            
            
            
            
            
            
            
            
            
        ])
    }
    
    
}

