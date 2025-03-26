//
//  AddBudgetCategoryView.swift
//  Budget
//
//  Created by Charles on 26/03/25.


import SwiftUI

struct AddBudgetCategoryView: View {
    
    @State private var title:String = ""
    @State private var total:Double = 100
    @State private var messages:[String] = []
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    var isFormValid:Bool {
        
        self.messages.removeAll()
        
        if title.isEmpty {
            messages.append("Kindly enter the title")
        }
        
        if total <= 0 {
            messages.append("Kindly enter the greater than zero value")
        }
        
        return self.messages.count == 0
    }
    
    private func save() {
        let budgetCategory = BudgetCategory(context: viewContext)
        budgetCategory.title = self.title
        budgetCategory.total = self.total
        do {
            try viewContext.save()
            dismiss()
        }catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("title",text:$title)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.plain)
                Slider(value: $total,in: 0...500) {
                    Text("Slider Value : \(total)")
                } minimumValueLabel: {
                    Text("$0")
                } maximumValueLabel: {
                    Text("$100")
                }
                Text(total as NSNumber,formatter: NumberFormatter.currency)
                    .frame(maxWidth:.infinity,alignment: .center)
                
                ForEach(self.messages,id:\.self) { message in
                    Text(message)
                }

            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if self.isFormValid {
                            self.save()
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    AddBudgetCategoryView()
}
