//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Дарья Яцынюк on 03.05.2023.
//
import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expenses.self)
    }
}
