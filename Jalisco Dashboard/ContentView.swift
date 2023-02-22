//
//  ContentView.swift
//  Jalisco Dashboard
//
//  Created by Felipe Arias on 2/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = "Ventas"
    var body: some View {
        HStack {
            VStack {
                TabButton(image: "chart.bar.xaxis", title: "Ventas", selectedTab: $selectedTab)
                TabButton(image: "person.and.background.dotted", title: "Tips", selectedTab: $selectedTab)
                TabButton(image: "banknote.fill", title: "Cheques", selectedTab: $selectedTab)
                TabButton(image: "creditcard.fill", title: "Depositos", selectedTab: $selectedTab)
                TabButton(image: "clock.fill", title: "PayRoll", selectedTab: $selectedTab)
                TabButton(image: "cart.fill", title: "Gastos", selectedTab: $selectedTab)
                TabButton(image: "dollarsign.circle.fill", title: "Balance", selectedTab: $selectedTab)
                TabButton(image: "person.3.fill", title: "Empleados", selectedTab: $selectedTab)
                Spacer()
                TabButton(image: "gear", title: "Configuración", selectedTab: $selectedTab)
            }
            .padding()
            .padding(.top)
            
            ZStack {
                switch selectedTab {
                case "Depositos": DepositsView()
                case "Empleados": EmployeesView()
                default: Text("No existe")
                }
            }.frame(maxWidth: .infinity)
        }.background(BlurView())
    }
}

struct TabButton: View {
    let image: String
    let title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(
            action: {
                selectedTab = title
            }, label: {
                VStack {
                    Image(systemName: image)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(selectedTab == title ? Color.orange : Color.gray)
                    
                    Text(title)
                        .fontWeight(.semibold)
                        .font(.system(size: 11))
                        .foregroundColor(selectedTab == title ? Color.orange : Color.gray)
                }
                .padding(.vertical, 8)
                .frame(width: 90, height: 50)
                .background(Color.secondary.opacity(selectedTab == title ? 0.15 : 0))
                .cornerRadius(10)
            }
        )
        .buttonStyle(LinkButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
