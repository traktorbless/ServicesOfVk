//
//  ErrorHomeView.swift
//  ServicesOfVk
//
//  Created by Антон Таранов on 14.07.2022.
//

import SwiftUI

struct ErrorHomeView: View {
    var body: some View {
        List {
            Text("Не удалось загрузить данные")
        }
        .listStyle(.plain)
    }
}

struct ErrorHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorHomeView()
    }
}
