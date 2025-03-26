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
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List(budgetResults) { budget in
                    HStack {
                        Text(budget.title ?? "")
                        Spacer()
                        Text(budget.total as NSNumber,formatter: NumberFormatter.currency)
                    }
                    
                }
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
