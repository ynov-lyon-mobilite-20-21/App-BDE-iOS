//
//  Created by Nicolas Barbosa on 26/10/2020.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    var animation: Namespace.ID
    var body: some View {
        VStack {
            Image(event.image.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image" + event.id, in: animation)
                .frame(width: UIScreen.main.bounds.width - 30)
            
            HStack {
                VStack(alignment: .center) {
                    Image("LAN_manette")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 5)
                        .foregroundColor(.whiteToYellow)
                        .frame(width: 60, height: 60)
                }
                    .background(Color.blueToBlack)
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 6) {
                    Text(event.name)
                        .font(.headline).foregroundColor(.gray)
                    Text(event.name)
                        .font(.title2).bold()
                        .foregroundColor(.blackToGreen)
                }
                Spacer()
            }
            .matchedGeometryEffect(id: "content" + event.id, in: animation)
            .padding()
            .background(Color.whiteToBlack)

        }
        .frame(height: 320)
        .background(Color.blueToBlack)
        .cornerRadius(15)
    }
}



