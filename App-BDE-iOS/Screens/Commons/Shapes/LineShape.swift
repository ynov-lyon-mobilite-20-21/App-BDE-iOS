//
//  LineShape.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 03/11/2020.
//

import SwiftUI

struct LineShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let tl = CGPoint(x: rect.minX, y: rect.minY)
        let tr = CGPoint(x: rect.maxX, y: rect.minY)

        path.move(to: tl)
        path.addLine(to: tr)

        return path
    }
}

struct LineShape_Previews: PreviewProvider {
    static var previews: some View {
        LineShape()
    }
}
