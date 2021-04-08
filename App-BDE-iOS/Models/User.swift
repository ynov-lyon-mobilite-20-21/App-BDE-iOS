//
//  User.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/11/2020.
//

import Foundation

struct User: Codable {

    var _id: String
    var mail: String
    var firstName: String
    var lastName: String
    var promotion: Promotion
    var formation: Formation
    var isAdmin: Bool
    var isAdherent: Bool
    var isActive: Bool

}

enum Promotion: String, Codable, CaseIterable, Equatable {
    static var allCases: [Promotion] {
        return [.b1, .b2, .b3, .m1, m2]
    }

    case defaultValue = "",
         b1 = "B1",
         b2 = "B2",
         b3 = "B3",
         m1 = "M1",
         m2 = "M2"
}

enum Formation: String, Codable, CaseIterable {
    static var allCases: [Formation] {
        return [.informatique,
                .audiovisuel,
                .anim3D, .creaDesign,
                .dataScientist,
                .expertReseau,
                .expertWeb,
                .expertLogicielMobile,
                .strat360,
                .dirArtistique,
                .entreprenariatStartup,
                .marketManaBigData]
    }

    case defaultValue = "",
         informatique = "Informatique",
         audiovisuel = "Audiovisuel",
         anim3D = "Animation 3D Jeux-Vidéo",
         creaDesign = "Création Design",
         dataScientist = "Data Scientist",
         expertReseau = "Expert Could, Sécurité & Infrastructure Réseau",
         expertWeb = "Expert Développement Web",
         expertLogicielMobile = "Expert Logiciel Mobile & IOT",
         strat360 = "Stratégie Communication 360°",
         dirArtistique = "Directeur Artistique Digital",
         entreprenariatStartup = "Entreprenariat & Start Up",
         marketManaBigData = "Marketing Manager & Big Data"
}
