//
//  LeagueModel.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 12.07.2022.
//

import Foundation

struct Leagues: Decodable {
    let status: Bool
    let data: [League]?
}

struct League: Decodable {
    let id: String
    let name: String
    let slug: String
    let abbr: String
    let logos: LeagueLogos?
}

struct LeagueLogos: Decodable {
    let light: String
    let dark: String
}





