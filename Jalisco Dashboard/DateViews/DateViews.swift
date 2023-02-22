//
//  DayPicker.swift
//  Jalisco Dashboard
//
//  Created by Felipe Arias on 2/6/23.
//

import SwiftUI

struct DayPicker: View {
    @Binding var day: Int
    @Binding var month: Int
    @State var range: Range<Int> = 1..<31
    
    var body: some View {
        Picker("Dia", selection: $day) {
            ForEach(range) {
                Text(String($0))
            }
        }.onChange(of: month, perform: onChange)
    }
    
    func onChange(newValue: Int) {
        range = 1..<DateM().getDaysOfMonth(month)+1
    }
}

struct MonthPicker: View {
    @Binding var month: Int
    
    var body: some View {
        Picker("Mes", selection: $month) {
            ForEach(1..<13) {
                Text(DateM().months[$0]).tag($0)
            }
        }
    }
}

struct YearStepper: View {
    @Binding var year: Int
    
    var body: some View {
        HStack {
            Text("Año")
            HStack {
                Text(String(year))
                Stepper("", value: $year, in: 2000...3000)
            }
            .padding(.leading, 5)
            .background(Color.white.opacity(0.3))
            .cornerRadius(4)
        }
    }
}

