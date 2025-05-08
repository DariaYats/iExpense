//
//  ContentView.swift
//  iExpense
//
//  Created by Дарья Яцынюк on 03.05.2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var expenses: [Expenses]
    @Environment(\.modelContext) var modelContext

    @State private var showingAddExpense = false
    @State private var sortOrder = [
        SortDescriptor(\Expenses.name),
        SortDescriptor(\Expenses.amount)
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            Text(expense.type)
                        }

                        Spacer()

                        Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundColor(color(for: expense.amount))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expanses", systemImage: "plus") {
                    showingAddExpense = true
                }

                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\Expenses.name),
                                SortDescriptor(\Expenses.amount)
                            ])

                        Text("Sort by amount")
                            .tag([
                                SortDescriptor(\Expenses.amount),
                                SortDescriptor(\Expenses.name)
                            ])
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
            }
        }
    }

    func color(for amount: Double) -> Color {
        if amount < 10 {
            return .green
        } else if amount < 100 {
            return .orange
        } else {
            return .red
        }
    }

    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = expenses[index]
            modelContext.delete(item)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
