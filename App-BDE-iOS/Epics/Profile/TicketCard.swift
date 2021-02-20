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
                    Text("test")
                        .font(.subheadline).foregroundColor(.gray)
                    Text("test")
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
        .background(Image("KOLOK_card")
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
