//
//  AddView.swift
//  iExpense
//
//  Created by Дарья Яцынюк on 01.05.2025.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    let types = ["Personal", "Business"]

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let newExpense = Expenses(name: name, type: type, amount: amount)
                    modelContext.insert(newExpense)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView()
        .modelContainer(for: Expenses.self)
}
