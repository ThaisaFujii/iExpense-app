//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Thaisa Fujii on 6/29/22.
//

import Foundation
//conforming to Codable is what asks the compiler to generate code for us able to handle archiving and unarchiving objects
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
