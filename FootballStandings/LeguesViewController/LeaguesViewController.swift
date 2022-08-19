//
//  AllLeaguesViewController.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 12.07.2022.
//

import UIKit

private extension LeaguesViewController {
    struct Constants {
        static let cellIdentifier = "Cell"
        static let title = "Leagues"
        static let rowHeight: CGFloat = 100
    }
}

protocol LeaguesViewInputProtocol: AnyObject {
    
}

protocol LeaguesViewOutputProtocol: AnyObject {
    init(view: LeaguesViewInputProtocol)
    func viewDidLoad()
}

class LeaguesViewController: UIViewController {

    var presenter: LeaguesViewOutputProtocol!
    
    private let configurator: LeagueConfiguratorInputProtocol = LeagueConfigurator()
    private var leagues: [League] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(LeagueViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Constants.title
        addSubviews()
        makeConstraints()
        tableView.rowHeight = Constants.rowHeight
        
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}


extension LeaguesViewController: LeaguesViewInputProtocol {
    
}

extension LeaguesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.isHidden = leagues.isEmpty
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? LeagueViewCell
        cell?.configure(model: leagues[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension LeaguesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
