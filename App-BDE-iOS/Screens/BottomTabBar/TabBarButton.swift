//
//  BottomTabBarItem.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct TabBarButton : View {
    
    @Binding var selected : String
    var value: String
    var imageSelected: String
    var imageUnselected: String
    
    var body: some View{
        
        Button(action: {
            selected = value
//            withAnimation(.spring()){
//                centerX = rect.midX
//            }
        }, label: {
            VStack{
                Image(selected == value ? imageUnselected : imageSelected)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                
                Text(value)
                    .font(.caption)
                    .foregroundColor(.black)
                    .opacity(selected == value ? 1 : 0)
            }
            // Deafult Frame For Reading Mid X Axis Fro Curve....
            .padding(.top)
            .frame(width: 70, height: 50)
        })
    }
}

struct BottomTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
