//
//  AddViewVM.swift
//  iExpense
//
//  Created by Thaisa Fujii on 6/30/22.
//

import Foundation

class AddViewVM: ObservableObject {
    @Published var expenses: Expenses = Expenses()
    
    @Published var name = ""
    @Published var type = "Personal"
    @Published var amount = 0.0
    
    let types = ["Business","Personal"]
}
