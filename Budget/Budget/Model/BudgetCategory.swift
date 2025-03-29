//
//  BudgetCategoryCoreData.swift
//  Budget
//
//  Created by Charles on 26/03/25.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory:NSManagedObject {
    
    public override func awakeFromFetch() {
        dateCreated = Date()
    }
}
