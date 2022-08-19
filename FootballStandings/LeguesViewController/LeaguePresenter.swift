//
//  LeaguePresenter.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 12.07.2022.
//

import Foundation

class LeaguePresenter: LeaguesViewOutputProtocol {
    unowned let view: LeaguesViewInputProtocol
    var interactor: LeagueInteractorInputProtocol!
    var router: LeagueRouterInputProtocol!
    
    required init(view: LeaguesViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchLeague()
    }
}
    // MARK: - LeagueInteractorOutputProtocol
    
extension LeaguePresenter: LeagueInteractorOutputProtocol {
    func leaguesDidReceive(_ leagues: [Leagues]) {
        
    }
    
    func leagueDidReceive(_ league: Leagues) {
        
    }
    
    
}



