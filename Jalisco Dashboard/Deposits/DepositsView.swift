//
//  DepositsView.swift
//  Jalisco Dashboard
//
//  Created by Felipe Arias on 2/2/23.
//

import SwiftUI

struct DepositsView: View {
    
    @State private var depositSelected = Deposit()
    @State private var depositIsSelected = false
    private var deposits = Deposits().allDeposits
    
    var body: some View {
        HStack {
            List{
                Button("Nuevo deposito", action: {depositIsSelected = true})
                ForEach(deposits) { deposit in
                    DepositButton(
                        deposit: deposit,
                        depositSelected: $depositSelected,
                        depositIsSelected: $depositIsSelected
                    )
                }
            }
            
            if depositIsSelected {
                DepositView(depositIsSelected: $depositIsSelected, depositSelected: $depositSelected)
//                DepositView(createDeposit: $createDeposit, day: $day, month: $month, year: $year)
            }
        }
    }
    
    func openDepositView() {
        depositIsSelected = true
    }
}

struct DepositButton: View {
    var deposit: Deposit
    @Binding var depositSelected: Deposit
    @Binding var depositIsSelected: Bool
    
    var new: some View {
        Button("Nuevo deposito", action: openNewDepositView)
    }
    
    func openNewDepositView() {
        withAnimation {
            if Deposit().id == depositSelected.id && depositIsSelected == true {
                depositSelected = Deposit()
                depositIsSelected = false
                return
            }
            depositIsSelected = true
            depositSelected = Deposit()
        }
    }
    
    var body: some View {
        Button(action: selectDeposit) {
            HStack {
                Text("\(deposit.day)")
                    .frame(width: 25)
                Text(" / ")
                Text("\(DateM().months[deposit.month])")
                    .frame(width: 70)
                Text(" / ")
                Text("\(String(deposit.year))")
                    .frame(width: 35)
                Text("$\(String(format: "%.2f", deposit.amount))")
                    .frame(width: 70)
                    .padding(.leading, 30)
            }
        }.background(deposit.id == depositSelected.id ? Color.orange : Color.white.opacity(0.0))
            .cornerRadius(4)
    }
    
    func selectDeposit() {
        withAnimation {
            if deposit.id == depositSelected.id && depositIsSelected == true {
                depositSelected = Deposit()
                depositIsSelected = false
                return
            }
            depositSelected = deposit
            depositIsSelected = true
        }
    }
}
