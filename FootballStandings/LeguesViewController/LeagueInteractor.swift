//
//  LeagueInteractor.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 19.08.2022.
//

import Foundation

protocol LeagueInteractorInputProtocol: AnyObject {
    init(presenter: LeagueInteractorOutputProtocol)
    func fetchLeague()
    func getLeague(at indexPath: IndexPath)
}

protocol LeagueInteractorOutputProtocol: AnyObject {
    func leaguesDidReceive(_ leagues: [Leagues])
    func leagueDidReceive(_ league: Leagues)
}

class LeagueInteractor: LeagueInteractorInputProtocol {
    required init(presenter: LeagueInteractorOutputProtocol) {
        
    }
    
    func fetchLeague() {
        
    }
    
    func getLeague(at indexPath: IndexPath) {
        
    }
    
    
}
