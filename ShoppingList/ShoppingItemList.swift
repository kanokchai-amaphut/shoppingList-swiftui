//
//  ShoppingItemList.swift
//  ShoppingList
//
//  Created by Kanokchai Amaphut on 29/9/2566 BE.
//

import SwiftUI
import RealmSwift

struct ShoppingItemList: View {
    @State var isAddPresened: Bool = false
    @ObservedRealmObject var shoppingList: ShoppingList

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(shoppingList.items) { item in
                        ShoppingItemCell(name: item.name, shoppingItem: item)
                    }
                }
                Spacer()
                .navigationTitle(shoppingList.title)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //action
                        isAddPresened = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $isAddPresened) {
                AddShoppingItem(shoppingList: shoppingList)
            }
        }
    }
}

struct ShoppingItemCell: View {
    var name: String
    @ObservedRealmObject var shoppingItem: ShoppingItem
    @State private var isCompleted = false
    var body: some View {
        HStack {
            Image(systemName: isCompleted ? "checkmark.circle" : "circle")
            Text(name)
        }.onTapGesture {
            isCompleted = true
        }
    }
}

struct ShoppingItemList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingItemList(shoppingList: ShoppingList())
    }
}
