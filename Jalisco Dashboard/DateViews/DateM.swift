//
//  DateManager.swift
//  Jalisco Dashboard
//
//  Created by Felipe Arias on 2/2/23.
//

import Foundation

struct DateM {
    let currentMonth: Int = Calendar.current.component(.month, from: Date())
    let currentDay: Int = Calendar.current.component(.day, from: Date())
    let currentYear: Int = Calendar.current.component(.year, from: Date())
    let months = ["","Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
    
    func getCurrentDate() -> Date {
        return Date()
    }
    
    func getDaysOfMonth(_ mes: Int) -> Int {
        switch mes {
        case 1, 3, 5, 7, 8, 10, 12: return 31
        case 4, 6, 9, 11: return 31
        case 2: return 28
        default: return 31
        }
    }
    
    func getDate(day: Int, month: Int, year: Int) -> Date {
        if day >= 1 && day <= 31 {
            if month >= 1 && month <= 12 {
                if year >= 2000 && month <= 3000 {
                    let dateComponents = DateComponents(calendar: Calendar.current, year: year, month: month, day: day)
                    return Calendar.current.date(from: dateComponents) ?? Date()
                }
            }
        }
        return Date()
    }
}

struct Month {
    let id = UUID()
    let name: String
    let number: Int
    let days: Int
}
