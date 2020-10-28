//
//  MainView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct MainView: View {
    
    @State private var selected: String = "Event"
    @State private var showModal: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        GeometryReader {reader in
            
            
            VStack(spacing: 0) {
                TabView {
                    CurrentScreen(selected: self.$selected)
                }
                BottomTabBar(selected: self.$selected, showModal: self.$showModal)
            }
            .sheet(isPresented: self.$showModal) { ContactsView() }
        }
    }
}


//// Custom Shape....
//
//struct AnimatedShape: Shape {
//
//    var centerX : CGFloat
//
//    // animating Path....
//
//    var animatableData: CGFloat{
//
//        get{return centerX}
//        set{centerX = newValue}
//    }
//
//    func path(in rect: CGRect) -> Path {
//
//        return Path{path in
//
//            path.move(to: CGPoint(x: 0, y: 15))
//            path.addLine(to: CGPoint(x: 0, y: rect.height))
//            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
//            path.addLine(to: CGPoint(x: rect.width, y: 15))
//
//            // Curve....
//
//            path.move(to: CGPoint(x: centerX - 35, y: 15))
//
//            path.addQuadCurve(to: CGPoint(x: centerX + 35, y: 15), control: CGPoint(x: centerX, y: -30))
//        }
//    }
//}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 11")
            MainView()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
