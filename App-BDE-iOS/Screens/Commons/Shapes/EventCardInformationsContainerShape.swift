//
//  EventCardInformationsContainerShape.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 31/10/2020.
//

import SwiftUI

struct TitleShape: Shape {
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let tl = CGPoint(x: rect.minX, y: rect.minY)
        let trs = CGPoint(x: rect.maxX - radius, y: rect.minY)
        let trc = CGPoint(x: rect.maxX - radius, y: rect.minY + radius)
        let brs = CGPoint(x: rect.maxX, y: rect.maxY - radius)
        let brc = CGPoint(x: rect.maxX - radius, y: rect.maxY - radius)
        let bl = CGPoint(x: rect.minX, y: rect.maxY)

        path.move(to: tl)
        path.addLine(to: trs)
        path.addRelativeArc(center: trc, radius: radius,
          startAngle: Angle.degrees(270), delta: Angle.degrees(90))
        path.addLine(to: brs)
        path.addRelativeArc(center: brc, radius: radius,
          startAngle: Angle.degrees(0), delta: Angle.degrees(90))
        path.addLine(to: bl)

        return path
    }
}

struct TitleShape_Previews: PreviewProvider {
    static var previews: some View {
        TitleShape(radius: 30)
    }
}
