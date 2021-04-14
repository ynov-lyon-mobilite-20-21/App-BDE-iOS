//
//  CheckoutSucceedView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 14/04/2021.
//

import SwiftUI

struct CheckoutTicketSucceedView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(colorScheme == .light ? Asset.Checkout.confirmTicketLight.name : Asset.Checkout.confirmTicketDark.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(CGSize(width: 1.3, height: 1.3))
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(L10n.CheckoutDone.Thanks.ticket)
                        .font(.body)
                    
                    Text(L10n.CheckoutDone.signature)
                }
                .padding(.horizontal, 20)
                Spacer()
            }
            .navigationTitle(L10n.CheckoutDone.title)
        }
    }
}

struct CheckoutSucceedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CheckoutTicketSucceedView()
            CheckoutTicketSucceedView()
                .previewDevice("iPhone 12")
        }
    }
}
