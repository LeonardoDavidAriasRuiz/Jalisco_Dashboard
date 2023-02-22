//
//  DepositView.swift
//  Jalisco Dashboard
//
//  Created by Felipe Arias on 2/6/23.
//

import SwiftUI

struct DepositView: View {
    @State private var day: Int = DateM().currentDay
    @State private var month: Int = DateM().currentMonth
    @State private var year: Int = DateM().currentYear
    @State private var amount: String = "2000"
    
    @State private var amountError: Bool = false
    
    
    
    @Binding var depositIsSelected: Bool
    @Binding var depositSelected: Deposit
    
    var body: some View {
        VStack{
            HStack {
                DayPicker(day: $day, month: $month)
                MonthPicker(month: $month)
                YearStepper(year: $year)
            }
            AmountView(amount: $amount)
            
            Button(action: saveAndClose) {
                Text("Guardar y cerrar")
            }
            .alert(isPresented: $amountError) {alertErrorAmount}
            Spacer()
            HStack {
                Button(action: deleteDeposit) {
                    Image(systemName: "trash.fill")
                }
                Spacer()
                Button(action: closeDepositView) {
                    Text("Cerrar")
                }
            }
        }
        .padding(30)
        .frame(maxHeight: .infinity, alignment: .top)
        .onChange(of: depositSelected) { newValue in
            day = newValue.day
            month = newValue.month
            year = newValue.year
            amount = String(newValue.amount)
        }
    }
    
    var alertErrorAmount: Alert {
        Alert(
            title: Text("Error en cantidad"),
            message: Text("Error al escribir la cantidad de deposito, escribe la cantidad con solo números."),
            primaryButton: Alert.Button.default(
                Text("Ok"),
                action: {amount = "2000"}),
            secondaryButton: Alert.Button.cancel())
    }
    
    func saveAndClose() {
        withAnimation {
            if Double(self.amount) != nil {
                closeDepositView()
            } else {
                amountError = true
            }
        }
    }
    func deleteDeposit() {
        withAnimation {
            closeDepositView()
        }
    }
    func closeDepositView() {
        withAnimation {
            depositSelected = Deposit()
            depositIsSelected = false
        }
    }
}
