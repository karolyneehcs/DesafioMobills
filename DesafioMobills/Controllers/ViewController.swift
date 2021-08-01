//
//  ViewController.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 30/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainview = MainView()
        mainview.despesaView.showEditView = self.showEditDespesa
        mainview.receitaView.showEditView = self.showEditReceita
        self.view = mainview
        let des = ReceitaCRUD()

//        for i in 0...10 {
//            des.create(valor: Double(i), descricao: "descri: \(i)", data: Date(), recebido: false)
//        }
    }
    
    func showEditDespesa(despesa: Despesa, completion: @escaping ()->Void) {
        let viewController = EditViewController()
        viewController.despesa = despesa
        viewController.completion = completion
        let nav = UINavigationController(rootViewController: viewController)
        self.navigationController?.present(nav, animated: true)
    }
    
    func showEditReceita(receita: Receita, completion: @escaping ()->Void) {
        let viewController = EditViewController()
        viewController.receita = receita
        viewController.completion = completion
        let nav = UINavigationController(rootViewController: viewController)
        self.navigationController?.present(nav, animated: true)
    }
}
