//
//  Service.swift
//  ServicesOfVk
//
//  Created by Антон Таранов on 14.07.2022.
//

import Foundation

struct Service: Codable {
    let name: String?
    let description: String?
    let link: String?
    let icon_url: String?
    
    var getUrl: URL? {
        URL(string: link ?? "")
    }
}

struct Response: Codable {
    var body: Services
    
    struct Services: Codable {
        var services = [Service]()
    }
}
