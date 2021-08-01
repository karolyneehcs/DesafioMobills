//
//  ReceitaView.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 30/07/21.
//

import UIKit

class ReceitaView: UIView {
    
    let receitaCRUD = ReceitaCRUD()
    var receitas: [Receita]?
    var showEditView: ((Receita, @escaping ()->Void) -> Void)?

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(ReceitaViewCell.self, forCellWithReuseIdentifier: ReceitaViewCell.reuseIdentifier)

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.configureLayout()
        self.receitas = self.receitaCRUD.search()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.addSubview(collectionView)

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    func updateData() {
      self.receitas = self.receitaCRUD.search()
      self.collectionView.reloadData()
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
        if let resc = receitas?[indexPath.row] {
            
            let delete = UIAction(title: "Delete") { (action) in
                self.receitaCRUD.delete(Receita: resc)
                self.updateData()
            }
            return delete
            
        }
        let delete = UIAction(title: "Delete") { (action) in }
        return delete
    }
    
    func editAction(_ indexPath: IndexPath) -> UIAction {
        if let resc = receitas?[indexPath.row] {
            
            let edit = UIAction(title: "Editar") { (action) in
                self.showEditView?(resc) {
                    self.updateData()
                }
            }
            return edit
            
        }
        let edit = UIAction(title: "edit") { (action) in }
        return edit
    }

}

extension ReceitaView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.receitas?.count ?? 0
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReceitaViewCell.reuseIdentifier, for: indexPath) as? ReceitaViewCell
        if let receita = self.receitas?[indexPath.row] {
            cell?.configure(receita: receita)
        }
        return cell!
    }

}
