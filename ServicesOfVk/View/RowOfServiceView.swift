//
//  RowOfService.swift
//  ServicesOfVk
//
//  Created by Антон Таранов on 14.07.2022.
//

import SwiftUI

struct RowOfServiceView: View {
    let service: Service
    
    var body: some View {
        HStack {
            AsyncImage(url: service.getUrlOfImage) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(service.unwrappedName)
                    .bold()
                
                Text(service.unwrappedDescription)
                    .font(.caption)
                
                Spacer()
            }
            .frame(width: 250, height: 75, alignment: .leading)
    
            NavigationLink {
                if let url = service.getUrlOfLink {
                    SafariView(url: url)
                } else {
                    Text("INVALID URL")
                }
            } label: {
                EmptyView()
            }
        }
        .onTapGesture {
            if let url = service.getUrlOfLink {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            }
        }
    }
}

struct RowOfService_Previews: PreviewProvider {
    static var previews: some View {
        RowOfServiceView(service: Service(name: "ВКонтакте", description: "Самая популярная соцсеть и первое суперприложение в России", link: "https://vk.com/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/vk.png"))
    }
}
