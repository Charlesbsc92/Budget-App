//
//  ContentView.swift
//  Budget
//
//  Created by Charles on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var budgetResults:FetchedResults<BudgetCategory>
    
    @State private var isPresented:Bool = false
    
    var totalBudget:Double {
        return budgetResults.reduce(0) { result, category in
            return result + category.total
        }
    }
    
    private func deleteCategory(category:BudgetCategory) {
        viewContext.delete(category)
        self.saveContext()
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        }catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(totalBudget as NSNumber,formatter: NumberFormatter.currency)
                    .font(.caption2)
                    .fontWeight(.semibold)
                BudgetListView(budgetResults: budgetResults, onDeleteBudgetCategory: deleteCategory)
            }
            .sheet(isPresented: $isPresented, content: {
                AddBudgetCategoryView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Category") {
                        isPresented = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
