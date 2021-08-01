//
//  DespesasCRUD.swift
//  DesafioMobills
//
//  Created by Ana Karolina Costa da Silva on 30/07/21.
//

import Foundation
import CoreData

class DespesasCRUD {

    func create(valor: Double, descricao: String, data: Date, pago: Bool) -> Despesa? {
        let context = CoreDataStack.shared.mainContext

        guard let entity = NSEntityDescription.entity(forEntityName: "Despesa", in: context) else {return nil}

        let despesa = NSManagedObject(entity: entity, insertInto: context)
        despesa.setValue(valor, forKey: "valor")
        despesa.setValue(descricao, forKey: "descricao")
        despesa.setValue(data, forKey: "data")
        despesa.setValue(pago, forKey: "pago")

        CoreDataStack.shared.saveContext()
        return despesa as? Despesa
    }

    func delete(despesa: Despesa) {
        let context = CoreDataStack.shared.mainContext
        context.delete(despesa)
        CoreDataStack.shared.saveContext()
    }

    func search() -> [Despesa]? {
        let context = CoreDataStack.shared.mainContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Despesa")

        do {
            let result = try context.fetch(fetchRequest)
            return result as? [Despesa]
        } catch {
            return nil
        }
    }
    
    func update(descricao: String?, valor: String?, data: String?, pago: Bool?, despesa: Despesa) {
        
        if let valor = valor, valor != ""{
            despesa.valor = Double(valor)!
        }
        
        if let descricao = descricao, descricao != "" {
            despesa.descricao = descricao
        }
        
        if let pago = pago {
            despesa.pago = pago
        }
        
        if let data = data, data != "" {
            let dateformatter = DateFormatter()
            despesa.data = dateformatter.date(from: data)
        }

        CoreDataStack.shared.saveContext()
    }
}
