//
//  ShapeWithTopCorderRadius.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 25/11/2020.
//

import SwiftUI

struct ShapeWithTopCorderRadius: Shape {
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
struct ShapeWithTopCorderRadius_Previews: PreviewProvider {
    static var previews: some View {
        ShapeWithTopCorderRadius(radius: 30)
    }
}
