//
//  TicketCard.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 04/02/2021.
//

import SwiftUI

struct TicketCard: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Type de l'event")
                        .font(.subheadline).foregroundColor(.gray)
                    Text("Nom de l'event")
                        .font(.title3).bold()
                        .foregroundColor(.blackToGreen)
                }
                Spacer()
            }
            .frame(height: 40)
            .padding(.horizontal)
            .padding(.vertical, 6)
            .background(Color.whiteToBlack)

        }
        .background(Image("card_KOLOK")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .background(Color.blueToBlack)
                        .padding(.bottom, 40)
        )
        .cornerRadius(15)
    }
}

struct TicketCard_Previews: PreviewProvider {
    static var previews: some View {
        TicketCard()
    }
}
