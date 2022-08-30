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
    unowned let presenter: LeagueInteractorOutputProtocol
    
    required init(presenter: LeagueInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchLeague() {
        NetworkManager.shared.fetchData { leagues in
            self.presenter.leaguesDidReceive(leagues)
        }
    }
    
    func getLeague(at indexPath: IndexPath) {
        
    }
    
    
}
