import SwiftUI

struct ListOfServicesView: View {
    let services: [Service]
    
    var body: some View {
        List {
            ForEach(services, id: \.self.name) { service in
                RowOfServiceView(service: service)
            }
        }
        .listStyle(.plain)
    }
}

struct ListOfServices_Previews: PreviewProvider {
    static var previews: some View {
        ListOfServicesView(services: [Service(name: "ВКонтакте", description: "Самая популярная соцсеть и первое суперприложение в России", link: "https://vk.com/", icon_url: "https://publicstorage.hb.bizmrg.com/sirius/vk.png")])
    }
}
