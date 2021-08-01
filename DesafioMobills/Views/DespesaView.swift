//
//  DespesaView.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 30/07/21.
//

import UIKit

class DespesaView: UIView {

    
    let despesaCRUD = DespesasCRUD()
    var despesas: [Despesa]? 
    var showEditView: ((Despesa, @escaping ()->Void) -> Void)?

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(DespesaViewCell.self, forCellWithReuseIdentifier: DespesaViewCell.reuseIdentifier)

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.configureLayout()
        self.despesas = self.despesaCRUD.search()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.addSubview(collectionView)

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    private func configureLayout() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    func deleteAction(_ indexPath: IndexPath) -> UIAction {
        if let desp = despesas?[indexPath.row] {
            
            let delete = UIAction(title: "Delete") { (action) in
                self.despesaCRUD.delete(despesa: desp)
                self.despesas = self.despesaCRUD.search()
                self.collectionView.reloadData()
            }
            return delete
            
        }
        let delete = UIAction(title: "Delete") { (action) in }
        return delete
    }
    
    func editAction(_ indexPath: IndexPath) -> UIAction {
        if let desp = despesas?[indexPath.row] {
            
            let edit = UIAction(title: "Editar") { (action) in
                self.showEditView?(desp) {
                    self.despesas = self.despesaCRUD.search()
                    self.collectionView.reloadData()
                }
            }
            return edit
            
        }
        let edit = UIAction(title: "edit") { (action) in }
        return edit
    }
}

extension DespesaView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.despesas?.count ?? 0
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

          return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
              let deleteAction = self.deleteAction(indexPath)
              let editAction = self.editAction(indexPath)

            return UIMenu(title: "", children: [deleteAction, editAction])

          }
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DespesaViewCell.reuseIdentifier, for: indexPath) as? DespesaViewCell
        if let despesa = self.despesas?[indexPath.row] {
            cell?.configure(despesa: despesa)
        }
        return cell!
    }

}
