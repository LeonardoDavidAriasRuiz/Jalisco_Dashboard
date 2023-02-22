//
//  Deposit.swift
//  Jalisco Dashboard
//
//  Created by Felipe Arias on 2/6/23.
//

import Foundation

struct Deposit: Identifiable, Equatable {
    let id: UUID
    var day: Int
    var month: Int
    var year: Int
    var amount: Double
    
    init(day: Int, month: Int, year: Int, amount: Double) {
        self.id = UUID()
        self.day = day
        self.month = month
        self.year = year
        self.amount = amount
    }
    
    init() {
        self.id = UUID()
        self.day = DateM().currentDay
        self.month = DateM().currentMonth
        self.year = DateM().currentYear
        self.amount = 0
    }
}
