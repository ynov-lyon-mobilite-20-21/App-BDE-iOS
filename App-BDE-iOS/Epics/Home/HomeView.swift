//
//  MainView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct HomeView: View {
    
//       override init() {
//            UITabBar.appearance().barTintColor = .systemBackground
//            UINavigationBar.appearance().barTintColor = .systemBackground
//        }
    
    @ObservedObject var viewModel: HomeViewModel
    @State private var showModal:Bool = false
    @State var selectedIndex = 0
    @State var shouldShowModal = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowModal, content: {
                        ContactsView()
                    })
                switch selectedIndex {
                case 0:
                    ViewProvider.event()
                    
                case 2:
                    ViewProvider.profile()
                    
                default:
                    NavigationView {
                        Text("Remaining tabs")
                    }
                }
                
            }
            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(0..<3) { num in
                    Button(action: {
                        if num == 1 {
                            shouldShowModal.toggle()
                            return
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 1 {
                            VStack {
                                Image(viewModel.tabBarImageNames[num].tabImage)
                                    .renderingMode(.template)
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(selectedIndex == num ? Color.bdePink : Color(.gray))
                                Text(viewModel.tabBarImageNames[num].tabName)
                                    .font(.system(size: 12))
                                    .foregroundColor(selectedIndex == num ? Color.bdePink : Color(.gray))
                            }
                        } else {
                            VStack {
                                Image(viewModel.tabBarImageNames[num].tabImage)
                                    .renderingMode(.template)
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(selectedIndex == num ? Color.bdePink : Color(.gray))
                                Text(viewModel.tabBarImageNames[num].tabName)
                                    .font(.system(size: 12))
                                    .foregroundColor(selectedIndex == num ? Color.bdePink : Color(.gray))
                            }
                        }
                        Spacer()
                    })
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(viewModel: HomeViewModel())
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 11")
            HomeView(viewModel: HomeViewModel())
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
