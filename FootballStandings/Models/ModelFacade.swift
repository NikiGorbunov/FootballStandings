//
//  ModelFacade.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 25.08.2022.
//

import Foundation

class ModelFacade {
    private let networkManager = NetworkManager()
    
    func getLeague(comletion: @escaping (_ leagues: [League]) -> Void) {
        networkManager.fetchData { leagues in
            guard let leagues = leagues else { return }
        }
        comletion(leagues.data)
    }
}
