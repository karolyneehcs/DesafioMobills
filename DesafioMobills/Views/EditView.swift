//
//  EditView.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 31/07/21.
//

import UIKit

class EditView: UIView {
    
    let descricao: UILabel = {
        let label = UILabel()
        label.text = "Descricao"
        label.font = UIFont.systemFont(ofSize: 18, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let valor: UILabel = {
        let label = UILabel()
        label.text = "Valor"
        label.font = UIFont.systemFont(ofSize: 18, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let data: UILabel = {
        let label = UILabel()
        label.text = "Data"
        label.font = UIFont.systemFont(ofSize: 18, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let pago: UILabel = {
        let label = UILabel()
        label.text = "Pago/Recebido"
        label.font = UIFont.systemFont(ofSize: 18, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descricaoTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Descricao"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let valorTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "00,00"
      textfield.keyboardType = .decimalPad
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let dataTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "00-00-0000"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let pago_recebido: UISwitch = {
        let button = UISwitch()
        button.isOn = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        self.addSubview(descricao)
        self.addSubview(valor)
        self.addSubview(data)
        self.addSubview(pago)
        self.addSubview(descricaoTF)
        self.addSubview(valorTF)
        self.addSubview(dataTF)
        self.addSubview(pago_recebido)
    
        NSLayoutConstraint.activate([
            descricao.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            descricao.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            descricaoTF.topAnchor.constraint(equalTo: self.descricao.bottomAnchor, constant: 5),
            descricaoTF.leadingAnchor.constraint(equalTo: self.descricao.leadingAnchor),
            descricaoTF.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            
            valor.topAnchor.constraint(equalTo: self.descricaoTF.bottomAnchor, constant: 40),
            valor.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            valorTF.topAnchor.constraint(equalTo: self.valor.bottomAnchor, constant: 5),
            valorTF.leadingAnchor.constraint(equalTo: self.valor.leadingAnchor),
            valorTF.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            
            data.topAnchor.constraint(equalTo: self.valorTF.bottomAnchor, constant: 40),
            data.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            dataTF.topAnchor.constraint(equalTo: self.data.bottomAnchor, constant: 5),
            dataTF.leadingAnchor.constraint(equalTo: self.data.leadingAnchor),
            dataTF.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            
            pago.topAnchor.constraint(equalTo: self.dataTF.bottomAnchor, constant: 40),
            pago.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            pago_recebido.topAnchor.constraint(equalTo: self.pago.bottomAnchor, constant: 10),
            pago_recebido.leadingAnchor.constraint(equalTo: self.pago.leadingAnchor),
            
            
        ])
    }
    
}
