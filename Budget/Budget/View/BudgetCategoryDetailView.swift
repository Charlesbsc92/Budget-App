//
//  BudgetCategoryDetailView.swift
//  Budget
//
//  Created by Charles on 27/03/25.
//

import SwiftUI

struct BudgetCategoryDetailView: View {
    
    let category:BudgetCategory
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.title ?? "")
            Text("\(category.total)")
        }
    }
}

