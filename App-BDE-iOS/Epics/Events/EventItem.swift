//
//  Created by Nicolas Barbosa on 26/10/2020.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    var body: some View {
        VStack(spacing: 0) {
                Image("card_LAN")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.blueToBlack)

                HStack {
                    VStack {
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
        EventItem(event: Event(_id: "1", name: "Espit Chupitos", type: .studentParty, image: .party, date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5))
            .preferredColorScheme(.dark)
            .frame(height: 320)
    }
}

// VStack {
//            Image("card_KOLOK")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: UIScreen.main.bounds.width - 30)
//
//            HStack {
//                VStack(alignment: .center) {
//                    Image("LAN_manette")
//                        .renderingMode(.template)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .padding(.all, 5)
//                        .foregroundColor(.whiteToYellow)
//                        .frame(width: 60, height: 60)
//                }
//                    .background(Color.blueToBlack)
//                    .cornerRadius(10)
//                VStack(alignment: .leading, spacing: 6) {
//                    Text(event.name)
//                        .font(.headline).foregroundColor(.gray)
//                    Text(event.name)
//                        .font(.title2).bold()
//                        .foregroundColor(.blackToGreen)
//                }
//                Spacer()
//            }
//            .padding()
//            .background(Color.whiteToBlack)
//
//        }
//        .frame(height: 300)
//        .background(Color.blueToBlack)
//        .cornerRadius(15)
