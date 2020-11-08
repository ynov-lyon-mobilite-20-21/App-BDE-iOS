//
//  User.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/11/2020.
//

import Foundation

struct User: Decodable {
    
    var mail: String
    var firstName: String
    var lastName: String
    var promotion: Promotion
    var formation: Formation
    var pictureUrl: String
    var isAdmin: Bool
    var isAdherent: Bool
    var stripeId: String
    var stripeSourceId: String
    
}


enum Promotion: String, Decodable {
    case B1 = "B1",
         B2 = "B2",
         B3 = "B3",
         M1 = "M1",
         M2 = "M2"
    
}
enum Formation: String, Decodable, CaseIterable {
    
    
    case defaultValue = "Choisissez votre formation",
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
