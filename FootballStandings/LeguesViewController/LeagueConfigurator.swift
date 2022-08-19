//
//  LeagueConfigurator.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 19.08.2022.
//

import Foundation

protocol LeagueConfiguratorInputProtocol {
    func configure(with viewController: LeaguesViewController)
}

class LeagueConfigurator: LeagueConfiguratorInputProtocol {
    func configure(with viewController: LeaguesViewController) {
        let presenter = LeaguePresenter(view: viewController)
        let interactor = LeagueInteractor(presenter: presenter)
        let router = LeagueRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
