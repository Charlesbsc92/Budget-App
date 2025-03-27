//
//  Transaction.swift
//  Budget
//
//  Created by Charles on 27/03/25.
//

import Foundation
import CoreData

public class Transaction:NSManagedObject {
    
    public override func awakeFromFetch() {
        self.dateCreated = Date()
    }
}
