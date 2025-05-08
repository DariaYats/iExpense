//
//  Expenses.swift
//  iExpense
//
//  Created by Дарья Яцынюк on 01.05.2025.
//

import SwiftData
import Foundation

@Model
class Expenses {
    var name: String
    var type: String
    var amount: Double

    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
