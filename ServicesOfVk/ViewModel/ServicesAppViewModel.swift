//
//  ServicesAppViewModel.swift
//  ServicesOfVk
//
//  Created by Антон Таранов on 14.07.2022.
//

import Foundation

class ServicesApp: ObservableObject {
    @Published private(set) var services = [Service]()
    
    @MainActor func loadData() async {
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
    
    private struct Response: Codable {
        var body: Services
        
        struct Services: Codable {
            var services = [Service]()
        }
    }
}
