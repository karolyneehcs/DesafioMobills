//
//  EditViewController.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 31/07/21.
//

import UIKit

class EditViewController: UIViewController {
    
    var despesa: Despesa?
    var receita: Receita?
    let despesasCRUD = DespesasCRUD()
    let receitasCRUD = ReceitaCRUD()

    let editView = EditView()
    var completion: (()->Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.editView
        
        self.title = "Editar"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
    }
    
    @objc func done() {
        let descricao = self.editView.descricaoTF.text
        let valor = self.editView.valorTF.text
        let data = self.editView.dataTF.text
        let pago_recebido = self.editView.pago_recebido.isOn
        
        if let despesa = self.despesa {
            self.despesasCRUD.update(descricao: descricao, valor: valor, data: data, pago: pago_recebido, despesa: despesa)
        } else if let receita = self.receita {
            self.receitasCRUD.update(descricao: descricao, valor: valor, data: data, recebido: pago_recebido, receita: receita)
        } else {
            fatalError()
        }
        self.completion?()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
}
