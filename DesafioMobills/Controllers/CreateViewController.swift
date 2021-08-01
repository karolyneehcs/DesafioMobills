//
//  CreateViewController.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 01/08/21.
//

import UIKit

import UIKit

class CreateViewController: UIViewController {
    var eReceita: Bool = true
    var despesa: Despesa?
    var receita: Receita?
    let despesasCRUD = DespesasCRUD()
    let receitasCRUD = ReceitaCRUD()

    let createView = EditView()
    var completion: (()->Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.createView

        self.title = "Criar"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
    }

    @objc func done() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let valor = (self.createView.valorTF.text! as NSString).doubleValue
        let pago_recebido = self.createView.pago_recebido.isOn
        let descricao: String = self.createView.descricaoTF.text ?? ""
        let data = self.createView.dataTF.text
        let novaData: Date

        if let data = data, data != "" {
          novaData = formatter.date(from: data) ?? Date()
        } else {
          novaData = Date()
        }

      //TODO: retirar force unwrap

        if eReceita {
          self.receitasCRUD.create(valor: valor, descricao: descricao, data: novaData, recebido: pago_recebido)
        } else {
          self.despesasCRUD.create(valor: valor, descricao: descricao, data: novaData, pago: pago_recebido)
        }

        self.completion?()
        self.dismiss(animated: true, completion: nil)
    }

    @objc func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
}
