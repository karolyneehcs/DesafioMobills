//
//  DespesaView.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 30/07/21.
//

import UIKit

class DespesaViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "DespesaViewCell"

    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "grad")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "debt")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descricao: UILabel = {
        let label = UILabel()
        label.text = "Descricao"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let valor: UILabel = {
        let label = UILabel()
        label.text = "Valor"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let data: UILabel = {
        let label = UILabel()
        label.text = "Data"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let pago: UILabel = {
        let label = UILabel()
        label.text = "Pago"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }

    func configure(despesa: Despesa) {
        self.descricao.text = despesa.descricao
        self.valor.text = "Valor: R$\(despesa.valor)"
        self.pago.text = despesa.pago ? "Pago" : "Pendente"
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd-MM-yyyy"
        let formatedData = dateFormatterGet.string(from: despesa.data ?? Date())
        self.data.text = "Data: \(formatedData)"
    }

    func setupView() {
        self.addSubview(backgroundImage)
        self.addSubview(icon)
        self.addSubview(descricao)
        self.addSubview(valor)
        self.addSubview(data)
        self.addSubview(pago)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.backgroundImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.backgroundImage.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.backgroundImage.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            self.icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.icon.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            self.icon.widthAnchor.constraint(equalTo: self.icon.heightAnchor),
            
            self.descricao.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: 10),
            self.descricao.topAnchor.constraint(equalTo: self.icon.topAnchor),
            
            self.valor.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: 10),
            self.valor.topAnchor.constraint(equalTo: self.descricao.bottomAnchor),
            
            self.data.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: 10),
            self.data.topAnchor.constraint(equalTo: self.valor.bottomAnchor),
            
            self.pago.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: 10),
            self.pago.topAnchor.constraint(equalTo: self.data.bottomAnchor),
            
            
        ])
    }
}
