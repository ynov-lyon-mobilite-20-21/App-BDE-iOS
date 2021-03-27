//
//  Created by Nicolas Barbosa on 26/10/2020.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    var body: some View {
        VStack(spacing: 0) {
            Image(event.imgType.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.blueToBlack)

                HStack {
                    VStack {
                        //TODO ajouter gestion icone pastille de card
                        Image("LAN_manette")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.bdeYellow)
                            .padding(6)
                            .background(Color.bdeBlue)
                            .cornerRadius(10)
                            .frame(width: 60, height: 60)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text(event.type.rawValue)
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.gray)
                        Text(event.name)
                            .font(.title3)
                            .bold()
                    }
                    .padding(.leading, 10)

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
            }
            .background(Color.whiteToBlue)
            .cornerRadius(20)
    }
}

struct EventItem_Previews: PreviewProvider {
    static var previews: some View {
        EventItem(event: Event(_id: "1",
                               name: "Espit Chupitos",
                               type: .studentParty,
                               imgType: .party,
                               date: "21/12/2020",
                               address: "22 rue du Test",
                               description: "C'est une sacré description",
                               price: 5))
            .preferredColorScheme(.dark)
            .frame(height: 320)
    }
}
