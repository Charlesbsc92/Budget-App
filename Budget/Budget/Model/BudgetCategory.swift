//
//  BudgetCategoryCoreData.swift
//  Budget
//
//  Created by Charles on 26/03/25.
//

import Foundation
import CoreData

@objc(BudgetCategory)
class BudgetCategory:NSManagedObject {
    
    override func awakeFromFetch() {
        dateCreated = Date()
    }
}
