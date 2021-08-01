//
//  MainView.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 30/07/21.
//

import UIKit

class MainView: UIView {
    var actionDespesa: (() -> Void )? = nil
    var actionReceita: (() -> Void)? = nil

    let despesaSection: UILabel = {
        let label = UILabel()
        label.text = "Despesas"
        return label
    }()
    
    let despesaView = DespesaView()
    
    let receitaSection: UILabel = {
        let label = UILabel()
        label.text = "Receitas"
        return label
    }()
    
    let receitaView = ReceitaView()

  let buttonAddReceita: UIButton = {
      let button = UIButton()
      let largeConfiguration = UIImage.SymbolConfiguration(scale: .large)
      let imageSymbol = UIImage(systemName: "plus.circle.fill", withConfiguration: largeConfiguration)
      let imageSymbolNew = imageSymbol?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setImage(imageSymbolNew, for: .normal)
      button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(addReceita), for: .touchUpInside)
      return button
    }()

  let buttonAddDespesa: UIButton = {
      let button = UIButton()
      let largeConfiguration = UIImage.SymbolConfiguration(scale: .large)
      let imageSymbol = UIImage(systemName: "plus.circle.fill", withConfiguration: largeConfiguration)
      let imageSymbolNew = imageSymbol?.withTintColor(.systemPurple, renderingMode: .alwaysOriginal)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setImage(imageSymbolNew, for: .normal)
      button.setTitleColor(.systemPurple, for: .normal)
    button.addTarget(self, action: #selector(addDespesa), for: .touchUpInside)
      return button
    }()

  @objc func addReceita() {
    self.actionReceita?()
  }

  @objc func addDespesa() {
    self.actionDespesa?()
  }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setupUpDespesasSection()
        self.setupUpReceitasSection()
        self.setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUpDespesasSection() {
        self.addSubview(despesaSection)
        self.addSubview(despesaView)
        
        self.despesaView.translatesAutoresizingMaskIntoConstraints = false
        self.despesaSection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.despesaSection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.despesaSection.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: 5),
            self.despesaView.topAnchor.constraint(equalTo: self.despesaSection.bottomAnchor, constant: 5),
            self.despesaView.leadingAnchor.constraint(equalTo: self.despesaSection.leadingAnchor),
            self.despesaView.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.despesaView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
        ])
    }
    
    private func setupUpReceitasSection() {
        self.addSubview(receitaSection)
        self.addSubview(receitaView)
        
        self.receitaView.translatesAutoresizingMaskIntoConstraints = false
        self.receitaSection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.receitaSection.topAnchor.constraint(equalTo: self.despesaView.bottomAnchor, constant: 70),
            self.receitaSection.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: 5),
            self.receitaView.topAnchor.constraint(equalTo: self.receitaSection.bottomAnchor, constant: 5),
            self.receitaView.leadingAnchor.constraint(equalTo: self.receitaSection.leadingAnchor),
            self.receitaView.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.receitaView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
        ])
    }

  private func setupButton() {
    self.addSubview(buttonAddReceita)
    self.addSubview(buttonAddDespesa)

    self.buttonAddReceita.translatesAutoresizingMaskIntoConstraints = false
    self.buttonAddDespesa.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      self.buttonAddReceita.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -65),
      self.buttonAddReceita.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 150),
      self.buttonAddReceita.widthAnchor.constraint(equalToConstant: 50),
      self.buttonAddReceita.heightAnchor.constraint(equalToConstant: 50)
    ])

    NSLayoutConstraint.activate([
      self.buttonAddDespesa.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -340),
      self.buttonAddDespesa.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 150),
      self.buttonAddDespesa.widthAnchor.constraint(equalToConstant: 50),
      self.buttonAddDespesa.heightAnchor.constraint(equalToConstant: 50)
    ])

  }
    
}
