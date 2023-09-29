//
//  ShoppingListCall.swift
//  ShoppingList
//
//  Created by Kanokchai Amaphut on 29/9/2566 BE.
//

import Foundation
import SwiftUI

struct ShoppingListCall: View {
    var title: String
    var address: String
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(address)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct ShopponigListCell_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListCall(title: "item 1", address: "testing data for address")
    }
}
