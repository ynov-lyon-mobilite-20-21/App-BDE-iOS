//
//  EventDetailView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 07/03/2021.
//

import SwiftUI
import CodeScanner

struct EventDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: EventDetailViewModel
    @State private var isShowingScanner = false
    
    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { _ in
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(viewModel.event.imgType.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                            .background(Color.blueToBlack)
                        HStack {
                            Spacer()
                            Button(action: {
                                self.presentation.wrappedValue.dismiss()
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
                        Text(viewModel.event.name)
                            .fontWeight(.bold)
                        Text(viewModel.event.type.rawValue)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                VStack {
                    HStack {
                        HStack {
                            Image(Asset.horloge.name)
                                .renderingMode(.template)
                                .foregroundColor(Color.blackToWhite)
                            Text(viewModel.event.hour)
                                .bold()
                        }
                        Spacer()
                        Text(viewModel.event.date)
                            .bold()
                    }
                    HStack {
                        Text(viewModel.event.address)
                        Spacer()
                    }
                    .padding(.top)
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
                .background(LinearGradient(gradient: Gradient(colors: [Color.blueToGreenGradiantStartingPoint, Color.blueToGreenGradiantEndingPoint]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(30)
            })
            
            if UserProvider.shared.user?.isAdmin == true {
                Button(action: {
                    self.isShowingScanner = true
                }, label: {
                    HStack {
                        Spacer()
                        Text(L10n.EventDetail.Button.scanner)
                        Spacer()
                    }
                })
                .padding(.vertical)
                .sheet(isPresented: $isShowingScanner) {
                    ViewProvider.QRScanner(event: viewModel.event)
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewProvider.eventDetail(event: Event(_id: "1",
                                                  name: "Espit Chupitos",
                                                  type: .studentParty,
                                                  imgType: .party,
                                                  logoType: .party,
                                                  date: "21/12/2020", hour: "20h",
                                                  address: "22 rue du Test",
                                                  description: "C'est une sacré  description",
                                              price: 5))
            ViewProvider.eventDetail(event: Event(_id: "1",
                                                  name: "Espit Chupitos",
                                                  type: .studentParty,
                                                  imgType: .party,
                                                  logoType: .party,
                                                  date: "21/12/2020", hour: "20h",
                                                  address: "22 rue du Test",
                                                  description: "C'est une sacré  description",
                                                  price: 5))
                .preferredColorScheme(.dark)
        }
    }
}
