//
//  SignInView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 19/11/2020.
//

import SwiftUI

struct UpdateInfoView: View {

    @ObservedObject var viewModel: UpdateInfoViewModel

    var body: some View {
            VStack {
                List {
                    Section(header: Text(L10n.UpdateInfoView.Section.personalInfos)) {
                        TextField(L10n.UpdateInfoView.TextField.PersonalInfos.firstName, text: $viewModel.firstName)
                            .textContentType(.name)
                            .disableAutocorrection(true)
                            .border(Color.red,
                                    width: viewModel.mailIsValid ? 1 : 0)

                        TextField(L10n.UpdateInfoView.TextField.PersonalInfos.name, text: $viewModel.lastName)
                            .textContentType(.familyName)
                            .disableAutocorrection(true)
                            .border(Color.red,
                                    width: viewModel.mailIsValid ? 1 : 0)
                    }

                    Section(header: Text(L10n.UpdateInfoView.Section.identifiers)) {

                        SecureField(L10n.UpdateInfoView.TextField.Identifiers.oldpassword, text: $viewModel.password)
                            .textContentType(.password)
                            .border(Color.red,
                                    width: viewModel.passwordIsValid ? 1 : 0)

                        SecureField(L10n.UpdateInfoView.TextField.Identifiers.password, text: $viewModel.password)
                            .textContentType(.password)
                            .border(Color.red,
                                    width: viewModel.passwordIsValid ? 1 : 0)
                    }

                    Section(header: Text(L10n.UpdateInfoView.Section.studentInfos)) {

                        Picker(L10n.UpdateInfoView.TextField.StudentInfos.promotion, selection: $viewModel.promotion) {
                            ForEach(Promotion.allCases, id: \.self) { promotion in
                                Text(promotion.rawValue)
                                    .tag(promotion)
                            }
                        }
                        .foregroundColor(Color.bdeGreen)
                        .pickerStyle(DefaultPickerStyle())

                        Picker(L10n.UpdateInfoView.TextField.StudentInfos.formation, selection: $viewModel.formation) {
                            ForEach(Formation.allCases, id: \.self) { promotion in
                                Text(promotion.rawValue)
                                    .tag(promotion)
                            }
                        }
                        .foregroundColor(Color.bdeGreen)
                        .pickerStyle(DefaultPickerStyle())

                    }
                    Button(action: {
                    }, label: {
                        HStack {
                            Spacer()
                            Text(L10n.UpdateInfoView.Button.updateInfos)
                            Spacer()
                        }
                    }).foregroundColor(Color.bdeGreen)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationBarTitle(L10n.UpdateInfoView.title, displayMode: .inline)
    }
}

struct UpdateInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UpdateInfoView(viewModel: UpdateInfoViewModel())
            UpdateInfoView(viewModel: UpdateInfoViewModel())
                .preferredColorScheme(.dark)
        }
    }
}
