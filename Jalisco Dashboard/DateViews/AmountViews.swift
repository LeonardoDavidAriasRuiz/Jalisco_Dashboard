//
//  AmountViews.swift
//  Jalisco Dashboard
//
//  Created by Felipe Arias on 2/6/23.
//

import SwiftUI

struct AmountView: View {
    @Binding var amount: String
    var body: some View {
        HStack {
            Text("Cantidad")
            TextField("Cantidad", text: $amount)
        }
    }
}
