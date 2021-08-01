//
//  ReceitasCRUD.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 30/07/21.
//

import Foundation
import CoreData

class ReceitaCRUD {

    func create(valor: Double, descricao: String, data: Date, recebido: Bool) -> Receita? {
        let context = CoreDataStack.shared.mainContext

        guard let entity = NSEntityDescription.entity(forEntityName: "Receita", in: context) else {return nil}

        let Receita = NSManagedObject(entity: entity, insertInto: context)
        Receita.setValue(valor, forKey: "valor")
        Receita.setValue(descricao, forKey: "descricao")
        Receita.setValue(data, forKey: "data")
        Receita.setValue(recebido, forKey: "recebido")

        CoreDataStack.shared.saveContext()
        return Receita as? Receita
    }

    func delete(Receita: Receita) {
        let context = CoreDataStack.shared.mainContext
        context.delete(Receita)
        CoreDataStack.shared.saveContext()
    }

    func search() -> [Receita]? {
        let context = CoreDataStack.shared.mainContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Receita")

        do {
            let result = try context.fetch(fetchRequest)
            return result as? [Receita]
        } catch {
            return nil
        }
    }
    
    func update(descricao: String?, valor: String?, data: String?, recebido: Bool?, receita: Receita) {
        
        if let valor = valor, valor != "" {
            receita.valor = Double(valor)!
        }
        
        if let descricao = descricao, descricao != "" {
            receita.descricao = descricao
        }
        
        if let recebido = recebido {
            receita.recebido = recebido
        }
        
        if let data = data, data != ""  {
            let dateformatter = DateFormatter()
            receita.data = dateformatter.date(from: data)
        }

        CoreDataStack.shared.saveContext()
    }
}
