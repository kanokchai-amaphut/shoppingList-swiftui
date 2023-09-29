//
//  ContentView.swift
//  ShoppingList
//
//  Created by Kanokchai Amaphut on 29/9/2566 BE.
//

import SwiftUI
import RealmSwift


struct ContentView: View {
    @State var isAddPresented = false
    @ObservedResults(ShoppingList.self) var shoppingLists
    var body: some View {
        NavigationStack {
            VStack {
                
                if shoppingLists.isEmpty {
                    Text("No item in shopping list")
                }
                
                List {
                    ForEach(shoppingLists) { shoppingLists in
                        NavigationLink(destination: ShoppingItemList(shoppingList: shoppingLists)) {
                            ShoppingListCall(title: shoppingLists.title, address: shoppingLists.address)
                        }
                    }
                    .onDelete() { index in
                        $shoppingLists.remove(atOffsets: index)
                    }
                    
                    
                }
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // action
                        isAddPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddPresented) {
                AddShoppingList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
