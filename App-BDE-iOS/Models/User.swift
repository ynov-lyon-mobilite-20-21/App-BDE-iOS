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
    var formationImage: String
    var isAdmin: Bool
    var isAdherent: Bool
    var isActive: Bool
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        _id = try container.decode(String.self, forKey: ._id)
        mail = try container.decode(String.self, forKey: .mail)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        promotion = try container.decode(Promotion.self, forKey: .promotion)
        formation = try container.decode(Formation.self, forKey: .formation)
        formationImage = User.logoFrom(formation: formation)
        isAdmin = try container.decode(Bool.self, forKey: .isAdmin)
        isAdherent = try container.decode(Bool.self, forKey: .isAdherent)
        isActive = try container.decode(Bool.self, forKey: .isActive)
    }
    
    enum CodingKeys: String, CodingKey {
        case _id, mail, firstName, lastName, promotion, formation, formationImage, isAdmin, isAdherent, isActive
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
    
    static private func logoFrom(formation: Formation) -> String {
        switch formation {
        case .defaultValue:
            return ""
        case .informatique:
            return "logoInfo"
        case .audiovisuel:
            return "logoAudio"
        case .anim3D:
            return "logoJeuVideo"
        case .creaDesign:
            return "logoCrea"
        case .dataScientist:
            return "logoInfo"
        case .expertReseau:
            return "logoInfo"
        case .expertWeb:
            return "logoInfo"
        case .expertLogicielMobile:
            return "logoInfo"
        case .strat360:
            return "logoCom"
        case .dirArtistique:
            return "logoCrea"
        case .entreprenariatStartup:
            return "logoCom"
        case .marketManaBigData:
            return "logoCom"
        }
    }
}
