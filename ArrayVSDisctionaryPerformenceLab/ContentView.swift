//
//  ContentView.swift
//  ArrayVSDisctionaryPerformenceLab
//
//  Created by Mohammad Alabed on 01/06/2022.
//

import SwiftUI

class MainPresenter: ObservableObject {

    @Published var rows:[CellViewPresneter] = []
    func append(sectionTitle: String, arrayValue: String, dictValue: String) {
        
        rows.append(CellViewPresneter(title: sectionTitle, arrayValue: arrayValue, dictValue: dictValue))
    }
}

struct ContentView: View {

    @StateObject fileprivate var presenter = MainPresenter()

    var body: some View {
        VStack {
            Button("Creation Time") {
                presenter.rows = []
                let arrayT = DataGenerator.shared.check(type: .array, opType: .create)
                let dictT = DataGenerator.shared.check(type: .dict, opType: .create)
                presenter.append(sectionTitle: "Creating Data", arrayValue: arrayT, dictValue: dictT)
            }
            Button("Access Time") {
                presenter.rows = []
                let arrayT = DataGenerator.shared.check(type: .array, opType: .access)
                let dictT = DataGenerator.shared.check(type: .dict, opType: .access)
                presenter.append(sectionTitle: "Access Item", arrayValue: arrayT, dictValue: dictT)
            }
            Button("Search Time") {
                presenter.rows = []
                let arrayT = DataGenerator.shared.check(type: .array, opType: .search)
                let dictT = DataGenerator.shared.check(type: .dict, opType: .search)
                presenter.append(sectionTitle: "Search Item", arrayValue: arrayT, dictValue: dictT)
            }
            Button("Append Time") {
                presenter.rows = []
                let arrayT = DataGenerator.shared.check(type: .array, opType: .append)
                let dictT = DataGenerator.shared.check(type: .dict, opType: .append)
                presenter.append(sectionTitle: "Append Item", arrayValue: arrayT, dictValue: dictT)
            }
            Button("Insert Time") {
                presenter.rows = []
                let arrayT = DataGenerator.shared.check(type: .array, opType: .insert)
                let dictT = DataGenerator.shared.check(type: .dict, opType: .insert)
                presenter.append(sectionTitle: "Intert Item", arrayValue: arrayT, dictValue: dictT)
            }
            Button("Delete Item Time") {
                presenter.rows = []
                let arrayT = DataGenerator.shared.check(type: .array, opType: .delete)
                let dictT = DataGenerator.shared.check(type: .dict, opType: .delete)
                presenter.append(sectionTitle: "Delete Item Item", arrayValue: arrayT, dictValue: dictT)
            }
            Button("Update Item Time") {
                presenter.rows = []
                let arrayT = DataGenerator.shared.check(type: .array, opType: .update)
                let dictT = DataGenerator.shared.check(type: .dict, opType: .update)
                presenter.append(sectionTitle: "Update Item Item", arrayValue: arrayT, dictValue: dictT)
            }
            Button("Update All Items Time") {
                presenter.rows = []
                let arrayT = DataGenerator.shared.check(type: .array, opType: .updateAll)
                let dictT = DataGenerator.shared.check(type: .dict, opType: .updateAll)
                presenter.append(sectionTitle: "Update All Items Item", arrayValue: arrayT, dictValue: dictT)
            }

            List(presenter.rows) { item in
                CellView(presentation: item)
            }
            .listStyle(.plain)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
