//
//  Expenses.swift
//  iExpense
//
//  Created by Thaisa Fujii on 6/29/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        
        didSet {
            //converting our data to JSON and use that json in our view
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    // init para pegar o input feito pelo usuario
    init() {
        // decoder let us go from JSON data to Swift objects
        // attempts to read whatever is in “Items” as a Data object
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            //does the actual job of unarchiving the Data object into an array of ExpenseItem objects.
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
