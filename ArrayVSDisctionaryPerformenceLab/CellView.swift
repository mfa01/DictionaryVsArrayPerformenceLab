//
//  CellView.swift
//  ArrayVSDisctionaryPerformenceLab
//
//  Created by Mohammad Alabed on 01/06/2022.
//

import SwiftUI

struct CellViewPresneter: Identifiable {
    var id = UUID()
    
    var title: String
    var arrayValue: String
    var dictValue: String
}

struct CellView: View {

    @State private var title = "Section title"
    @State private var arrayValue = "-"
    @State private var dictValue = "-"

    @State var presentation: CellViewPresneter? {
        didSet {
            updateUI()
        }
    }

    private func updateUI() {
        if let presentation = presentation {
            title = presentation.title
            arrayValue = presentation.arrayValue
            dictValue = presentation.dictValue
        }
    }

    var body: some View {
        VStack {
            Text(title).font(.system(.title))
            HStack {
                Text("Array:").font(.system(.headline))
                Spacer()
                Text(arrayValue)
            }
            HStack {
                Text("Dictionary:").font(.system(.headline))
                Spacer()
                Text(dictValue)
            }
        }
        .onAppear {
            updateUI()
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
