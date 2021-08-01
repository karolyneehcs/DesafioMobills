//
//  DespesaViewController.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 30/07/21.
//

import UIKit

class DespesaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = DespesaViewCell()
        // Do any additional setup after loading the view.
    }
//    func deleteAction(_ indexPath: IndexPath) -> UIAction {
//        if let desp = despesas?[indexPath.row] {
//            
//            let delete = UIAction(title: "Delete") { (action) in
//                self.despresaCRUD.delete(despesa: desp)
//                self.despesas = self.despresaCRUD.search()
//                self.collectionView.reloadData()
//            }
//            return delete
//
//        }
//        let delete = UIAction(title: "Delete") { (action) in }
//        return delete
//    }
//
//    func editAction(_ indexPath: IndexPath) -> UIAction {
//        if let desp = despesas?[indexPath.row] {
//
//            let edit = UIAction(title: "Editar") { (action) in
//                let nav = UINavigationController(rootViewController: UIViewControlle())
//
//            }
//            return edit
//
//        }
//        let edit = UIAction(title: "edit") { (action) in }
//        return edit
//    }
}
