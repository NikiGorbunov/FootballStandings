//
//  LeagueViewCellModel.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 22.08.2022.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifiable: String { get }
    var cellHeight: Double { get }
}

protocol SectionRowRepresentable {
    var rows: [CellIdentifiable] { get set }
}

open class LeagueViewCellModel: CellIdentifiable {
    var leagueName: String
    var leagueAbbr: String
    var imageURL: String
    
    var cellIdentifiable: String {
        "LeagueCell"
    }
    var cellHeight: Double{
        100
    }
    
    init(league: League) {
        leagueName = league.name
        leagueAbbr = league.abbr
        imageURL = league.logos?.light ?? ""
    }
    
    
}

class LeagueSectionViewModel: SectionRowRepresentable {
    var rows: [CellIdentifiable] = []
    
    
}
