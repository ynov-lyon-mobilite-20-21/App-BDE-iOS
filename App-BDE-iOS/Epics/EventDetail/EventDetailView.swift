//
//  EventDetailView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 25/11/2020.
//

import SwiftUI

struct EventDetailView: View {

    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel : EventViewModel
    @State var scale : CGFloat = 1

    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { reader in
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(/*viewModel.selectedItem.image.rawValue*/ "KOLOK_Card_1920x1080")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                            .background(Color.blueToBlack)
                        HStack{
                            Spacer()
                            Button(action: {
                                self.presentation.wrappedValue.dismiss()
                                viewModel.show.toggle()
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.black.opacity(0.7))
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal)
                        // since we ignored top area...
                        .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top)
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                
                HStack{
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
                        Text(viewModel.selectedItem.type.rawValue)
                            .fontWeight(.bold)
                        Text(viewModel.selectedItem.name)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                Text("Race through the ultimate street racing scene at dizzying speed withthe tap of your finger! Have fun winning the racing car collection of your dreams. Pick an event, choose a lineup of cars from your collection, and start racing for infamy in the first Forza game for mobile.\n\nCOLLECT AND UPGRADE ICONIC CARS\nRace to collect legendary cars at intense speed – from classic muscle to modern sports and retro supercars – turning your garage into a trophy case of iconic racing cars, with all the fun, attention to graphics detail, and speed Forza is known for.\n\nTRUE CINEMATIC RACING\nStreamlined controls focus on the fun - timing your gas, brake, and boost are the keys to victory, as action cams chase the racing adrenaline up close showcasing amazing graphics. The stunning, best in class, 3D visuals bring the action to life while you’re speeding across the asphalt. It’s a fun, new, and wholly unique way to enjoy Forza.\n\nRACE ON YOUR TERMS\nRace your collection of cars anytime, anywhere. Squeeze in a fun, quick one-minute race, or dive into immersive story driven events with multiple paths to victory in the cars you love. New controls let you easily race with the tap of a finger to control your gas, brake, and boost. Forza Street has something fun for you any time you feel like racing at high speed and boosting across the finish line to victory.")
                    .padding()
            }
        }
        .scaleEffect(scale)
        .ignoresSafeArea(.all, edges: .top)
    }
}

