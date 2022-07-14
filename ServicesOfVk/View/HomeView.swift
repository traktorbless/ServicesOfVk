//
//  ContentView.swift
//  ServicesOfVk
//
//  Created by Антон Таранов on 14.07.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var servicesApp = ServicesApp()
    
    var body: some View {
        NavigationView {
            ListOfServicesView(services: servicesApp.services)
            .task {
                await servicesApp.loadData()
            }
            .navigationTitle("Сервисы VK")
            .navigationBarTitleDisplayMode(.inline)
        }
        .refreshable {
            Task {
                await servicesApp.loadData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
