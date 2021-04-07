//
//  ContactsView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct ContactsView: View {
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { gr in
            
            ScrollView {
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    
                    Button("Dismiss") {
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                .frame(width: gr.size.width)
                
            }
        }
        
        .background(
            ZStack {
                Color.whiteToBlue
                Image(Asset.backgroundEvent.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(colorScheme == .dark ? 0.2 : 1)
            }
            .ignoresSafeArea(edges: .top)
        )
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
