//
//  ContentView.swift
//  ServicesOfVk
//
//  Created by Антон Таранов on 14.07.2022.
//

import SwiftUI

struct HomeView: View {
    @State var services = [Service]()
    
    var body: some View {
        NavigationView {
            ListOfServicesView(services: services)
            .task {
                await loadData()
            }
            .navigationTitle("Сервисы VK")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                services = decodedResponse.body.services
            } else {
                print("Invalid decode")
            }
        } catch {
            print("Invalid data")
        }
                            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
