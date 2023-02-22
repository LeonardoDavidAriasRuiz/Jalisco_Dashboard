//
//  EmployeesView.swift
//  Jalisco Dashboard
//
//  Created by Felipe Arias on 2/1/23.
//

import SwiftUI

struct EmployeesView: View {
    @State var employeeSelected = Employee(id: UUID(), firstName: "", lastName: "")
    @State var employyeIsSelected = false
    @State var employees = [
        Employee(id: UUID(), firstName: "Leonardo", lastName: "Arias"),
        Employee(id: UUID(), firstName: "Oscar", lastName: "Galvan"),
        Employee(id: UUID(), firstName: "Zosimo", lastName: "Blancas"),
        Employee(id: UUID(), firstName: "Maura", lastName: "Montoya")
    ]
    var body: some View {
        HStack {
            List{
                ForEach(employees) { employee in
                    EmployeeButton(buttonEmployee: employee, employeeSelected: $employeeSelected, employeeIsSelected: $employyeIsSelected)
                }
                NewEmployeeButton(employyeeSelected: $employeeSelected, employyeIsSelected: $employyeIsSelected)
            }
            .frame(minWidth: 200)
            if employyeIsSelected {
                EmployeeView(employeeSelected: $employeeSelected, employyeIsSelected: $employyeIsSelected)
            }
        }
    }
}

struct EmployeeView: View {
    @Binding var employeeSelected: Employee
    @Binding var employyeIsSelected: Bool
    
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .foregroundColor(.orange)
                Text("\(String(employeeSelected.firstName.first ?? " ").uppercased())\(String(employeeSelected.lastName.first ?? " ").uppercased())")
                    .bold()
                    .font(.system(size: 150))
                    .fontDesign(.rounded)
            }.frame(width: 300)
            HStack {
                TextField("Nombre", text: $employeeSelected.firstName)
                TextField("Apellido", text: $employeeSelected.lastName)
                Button(action: saveAndClose) {
                    Text("Guardar y cerrar")
                }
                
            }
            Spacer()
            HStack {
                Button(action: deleteEmployee) {
                    Image(systemName: "trash.fill")
                }
                Spacer()
                Button(action: closeView) {
                    Text("Cerrar")
                }
            }
        }
        .padding(30)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    func deleteEmployee() {
        withAnimation {
            employyeIsSelected = false
        }
    }
    
    func saveAndClose() {
        withAnimation {
            employyeIsSelected = false
        }
    }
    
    func closeView() {
        withAnimation {
            employyeIsSelected = false
        }
    }
}

struct NewEmployeeButton: View {
    @Binding var employyeeSelected: Employee
    @Binding var employyeIsSelected: Bool
    
    var body: some View {
        Button(action: openEmployeeView) {
            HStack {
                Text("Agregar empleado")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    func openEmployeeView() {
        withAnimation {
            employyeIsSelected = true
            employyeeSelected = Employee(id: UUID(), firstName: "", lastName: "")
        }
    }
}

struct EmployeeButton: View {
    var buttonEmployee: Employee
    @Binding var employeeSelected: Employee
    @Binding var employeeIsSelected: Bool
    
    var body: some View {
        Button(action: selectEmployee) {
            HStack {
                Text("\(buttonEmployee.lastName), \(buttonEmployee.firstName)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    func selectEmployee() {
        withAnimation {
            if buttonEmployee.id == employeeSelected.id && employeeIsSelected == true {
                employeeIsSelected = false
                return
            }
            employeeSelected = buttonEmployee
            employeeIsSelected = true
        }
    }
}

struct Employee: Identifiable {
    let id: UUID
    var firstName: String
    var lastName: String
}

struct EmployeesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
