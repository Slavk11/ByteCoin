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
        element.font = .systemFont(ofSize: 50.0, weight: .thin)
        element.textAlignment = .center
        element.textColor = UIColor(named: "Title Color")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var coinView: UIView = {
        let element = UIView()
        element.backgroundColor = .tertiaryLabel
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var coinStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.alignment = .center
        element.spacing = 10
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var imageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: "bitcoinsign.circle.fill")
        element.contentMode = .scaleAspectFill
        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bitcoinPriceLabel: UILabel = {
        let element = UILabel()
        element.text = "..."
        element.textAlignment = .right
        element.textColor = .white
        element.font = .systemFont(ofSize: 25)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var currencyLabel: UILabel = {
        let element = UILabel()
        element.text = "USD"
        element.textAlignment = .right
        element.textColor = .white
        element.font = .systemFont(ofSize: 25)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var pickerView: UIPickerView = {
        let element = UIPickerView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let coinManager = CoinManager()
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        setViews()
        setConstraints()
    }
    
    // MARK: - Set Views and Set Constraints
    
    private func setViews() {
        view.backgroundColor = UIColor(named: "Background Color")
        view.addSubview(mainStackView)
        view.addSubview(pickerView)
        
        coinView.layer.cornerRadius = 40
       
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(coinView)
        
        coinView.addSubview(coinStackView)
        
        coinStackView.addArrangedSubview(imageView)
        coinStackView.addArrangedSubview(bitcoinPriceLabel)
        coinStackView.addArrangedSubview(currencyLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            coinView.heightAnchor.constraint(equalToConstant: 80),
            
            coinStackView.topAnchor.constraint(equalTo: coinView.topAnchor),
            coinStackView.bottomAnchor.constraint(equalTo: coinView.bottomAnchor),
            coinStackView.leadingAnchor.constraint(equalTo: coinView.leadingAnchor),
            coinStackView.trailingAnchor.constraint(equalTo: coinView.trailingAnchor, constant: -10),
            
            imageView.widthAnchor.constraint(equalToConstant: 80),
            
            pickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 216),
            
            
           
            
            
        ])
    }
    
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = (coinManager.currencyArray[row])
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}
