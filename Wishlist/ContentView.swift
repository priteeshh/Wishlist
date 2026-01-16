//
//  ContentView.swift
//  Wishlist
//
//  Created by Preeteesh Remalli on 04/01/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    @State private var isAlerShowing: Bool = false
    @State private var title: String = ""

    var body: some View {
        NavigationStack {
            List(wishes) { wish in
                Text(wish.title)
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            modelContext.delete(wish)
                        }
                    }
            }
            .navigationTitle("Wishlist")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAlerShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }

            }
            .alert("Add Wish", isPresented: $isAlerShowing) {
                TextField("Enter a Wish", text: $title)
                
                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
            }
        }
        .overlay {
            if wishes.isEmpty {
                ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes added yet. Add a wish to get started."))
            }
        }
    }
}

#Preview("List with sample data") {
    let container = try! ModelContainer(
        for: Wish.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    container.mainContext.insert(Wish(title: "Learn Swift UI"))
    container.mainContext.insert(Wish(title: "Learn Swift Data"))
    container.mainContext.insert(Wish(title: "Learn Combine"))
    container.mainContext.insert(Wish(title: "Learn Animations"))

    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
