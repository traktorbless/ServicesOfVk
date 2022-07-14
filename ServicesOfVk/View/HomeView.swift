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
            if !servicesApp.services.isEmpty {
                ListOfServicesView(services: servicesApp.services)
                    .navigationTitle("Сервисы VK")
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                ErrorHomeView()
                    .navigationTitle("Сервисы VK")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .task {
            await servicesApp.loadData()
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
