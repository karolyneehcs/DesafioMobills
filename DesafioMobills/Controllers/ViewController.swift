//
//  ViewController.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 30/07/21.
//

import UIKit

class ViewController: UIViewController {

    let mainview = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainview.despesaView.showEditView = self.showEditDespesa
        mainview.receitaView.showEditView = self.showEditReceita
        mainview.actionDespesa = self.createDespesa
        mainview.actionReceita = self.createReceita
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

  func createReceita() {
//      print("chamou? to aqui")
      let viewController = CreateViewController()
      viewController.eReceita = true
      viewController.completion = {
        self.mainview.receitaView.updateData()
      }
      let nav = UINavigationController(rootViewController: viewController)
      self.navigationController?.present(nav, animated: true, completion: nil)
    }

  func createDespesa() {
//      print("chamou? to aqui")
    let viewController = CreateViewController()
    viewController.eReceita = false 
    viewController.completion = {
      self.mainview.despesaView.despesas = self.mainview.despesaView.despesaCRUD.search()
      self.mainview.despesaView.collectionView.reloadData()
    }
    let nav = UINavigationController(rootViewController: viewController)
    self.navigationController?.present(nav, animated: true, completion: nil)
  }

}
