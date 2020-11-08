//
//  EventCardInformationsContainerShape.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 31/10/2020.
//

import SwiftUI

struct ContainerTopCornerRadius: Shape {
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        

        
        let trs = CGPoint(x: rect.maxX - radius, y: rect.minY)
        let trc = CGPoint(x: rect.maxX - radius, y: rect.minY + radius)
        let br = CGPoint(x: rect.maxX, y: rect.maxY)
        let bl = CGPoint(x: rect.minX, y: rect.maxY)
        let tls = CGPoint(x: rect.minX, y: rect.minY + radius)
        let tlc = CGPoint(x: rect.minX + radius, y: rect.minY + radius)
        
        
        path.move(to: bl)
        path.addLine(to: tls)
        path.addRelativeArc(center: tlc, radius: radius,
          startAngle: Angle.degrees(180), delta: Angle.degrees(90))
        path.addLine(to: trs)
        path.addRelativeArc(center: trc, radius: radius,
          startAngle: Angle.degrees(270), delta: Angle.degrees(90))
        path.addLine(to: br)
        path.closeSubpath()
        
        
        return path
    }
}

struct EventCardInformationsContainerShape_Previews: PreviewProvider {
    static var previews: some View {
        ContainerTopCornerRadius(radius: 30)
    }
}

