//
//  Model.swift
//  ValorantCharacters
//
//  Created by Sevval Alev on 12.10.2022.
//

import Foundation

struct CharacterData: Decodable {
    let data: [Data]?
}

struct Data: Decodable {
    let displayName: String?
    let description: String?
    let displayIcon: String?
    let background: String?
    let fullPortrait: String?
    let role: Role?
    let abilities: [Abilities]?
    let backgroundGradientColors: [String]?
}

struct Role: Decodable {
    var displayName: String?
    var displayIcon: String?
    var description: String?
    
}

struct Abilities: Decodable{
    var slot: String?
    var description: String?
    var displayIcon: String?
}

