//
//  EventDetailView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 07/03/2021.
//

import SwiftUI
import CodeScanner

struct EventDetailView: View {

    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: EventViewModel
    @State private var isShowingScanner = false

    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { _ in
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(/*viewModel.selectedItem.image.rawValue*/ "card_KOLOK")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                            .background(Color.blueToBlack)
                        HStack {
                            Spacer()
                            Button(action: {
                                self.presentation.wrappedValue.dismiss()
                                viewModel.show.toggle()
                            }) {
                                Image(systemName: "xmark")
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(Color.black.opacity(0.7))
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                                    .padding(.top)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)

                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(viewModel.event.type.rawValue)
                            .fontWeight(.bold)
                        Text(viewModel.event.address)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                VStack {
                    HStack {
                        HStack {
                            Image("horloge")
                                .renderingMode(.template)
                                .foregroundColor(Color.blackToWhite)
                            Text(viewModel.event.date)
                        }
                        Spacer()
                        Text(viewModel.event.date)
                    }
                    HStack {
                        Text(viewModel.event.address)
                        Spacer()
                    }
                }
                .padding(.horizontal)

                Text(viewModel.event.description)
                    .padding()
            }

            Button(action: {

            }, label: {
                HStack {
                    Text(L10n.EventDetail.Button.payment)
                        .foregroundColor(Color.white)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 70)
                }
                .background(Color.bdeBlue)
                .cornerRadius(30)
            })

            Button(action: {
                self.isShowingScanner = true
            }, label: {
                HStack {
                    Spacer()
                    Text("Scanner")
                    Spacer()
                }
            })
            .sheet(isPresented: $isShowingScanner) {
                ViewProvider.QRScanner()
            }
        }
        .ignoresSafeArea(.all, edges: .top)

    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ViewProvider.eventDetail(event: Event(_id: "1", name: "Espit Chupitos", type: .studentParty, image: .party, date: "21/12/2020", address: "22 rue du Test", description: "C'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré descriptionC'est une sacré description", price: 5))
    }
}
