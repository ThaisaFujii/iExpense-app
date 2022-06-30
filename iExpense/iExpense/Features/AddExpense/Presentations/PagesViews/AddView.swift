//
//  AddView.swift
//  iExpense
//
//  Created by Thaisa Fujii on 6/29/22.
//

import SwiftUI

struct AddView: View {
    //@ObservedObject var addviewVM = AddViewVM()
    @ObservedObject var expenses: Expenses
    // environment allow us to dismiss the sheet and shows the details of the list
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State var amount = 0.0
    
    let types = ["Business","Personal"]
    
    // definir o tipo de moeda inserida pelo usuario
    var formatter: NumberFormatter = { let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencySymbol = "US$"
            return formatter
        }()

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, formatter: formatter)
                    .keyboardType(.decimalPad)
//                TextField("Amount", value: $amount, format: .currency(code: "USD"))
//                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
