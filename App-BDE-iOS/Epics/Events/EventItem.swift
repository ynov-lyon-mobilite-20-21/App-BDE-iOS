//
//  Created by Nicolas Barbosa on 26/10/2020.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Image(event.imgType.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(Color.blueToBlack)
            
            HStack {
                VStack {
                    Image(event.logoType.rawValue)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.bdeYellow)
                        .padding(6)
                        .background(Color.bdeBlue)
                        .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text(event.type.rawValue)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.gray)
                    Text(event.name)
                        .font(.headline)
                        .bold()
                }
                .padding(.leading, 10)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 6)
            .sheet(isPresented: self.$showModal) { ViewProvider.eventDetail(event: event) }
        }
        .background(Color.whiteToBlue)
        .cornerRadius(20)
        .onTapGesture {
            self.showModal = true
        }
        
    }
}

struct EventItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventItem(event: Event(_id: "1",
                                   name: "Espit Chupitos",
                                   type: .studentParty,
                                   imgType: .party,
                                   logoType: .sport,
                                   date: "21/12/2020", hour: "20h",
                                   address: "22 rue du Test",
                                   description: "C'est une sacré description",
                                   price: 5))
                .frame(height: 320)
            EventItem(event: Event(_id: "1",
                                   name: "Espit Chupitos",
                                   type: .studentParty,
                                   imgType: .party,
                                   logoType: .party,
                                   date: "21/12/2020", hour: "20h",
                                   address: "22 rue du Test",
                                   description: "C'est une sacré description",
                                   price: 5))
                .preferredColorScheme(.dark)
                .frame(height: 320)
        }
    }
}
