//
//  BudgetListView.swift
//  Budget
//
//  Created by Charles on 26/03/25.
//

import SwiftUI

struct BudgetListView: View {
    
    let budgetResults:FetchedResults<BudgetCategory>
    let onDeleteBudgetCategory:(BudgetCategory) -> Void
    
    var body: some View {
        List {
            ForEach(budgetResults) { budget in
                HStack {
                    Text(budget.title ?? "")
                    Spacer()
                    Text(budget.total as NSNumber,formatter: NumberFormatter.currency)
                }
            }
            .onDelete { indexSet in
                indexSet.map{budgetResults[$0]}.forEach(onDeleteBudgetCategory)
            }
        }
    }
}

