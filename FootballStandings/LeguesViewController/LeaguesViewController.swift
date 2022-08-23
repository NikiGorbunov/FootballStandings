//
//  AllLeaguesViewController.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 12.07.2022.
//

import UIKit

private extension LeaguesViewController {
    struct Constants {
        static let cellIdentifier = "LeagueCell"
        static let title = "Leagues"
        static let rowHeight: CGFloat = 100
    }
}

protocol LeaguesViewInputProtocol: AnyObject {
    func reloadData(for section: LeagueSectionViewModel)
}

protocol LeaguesViewOutputProtocol: AnyObject {
    init(view: LeaguesViewInputProtocol)
    func viewDidLoad()
}

class LeaguesViewController: UIViewController {

    var presenter: LeaguesViewOutputProtocol!
    
    private let configurator: LeagueConfiguratorInputProtocol = LeagueConfigurator()
    private var sectionViewModel: SectionRowRepresentable = LeagueSectionViewModel()
    
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


//MARK: - UITableViewDataSource

extension LeaguesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifiable, for: indexPath) as? LeagueViewCell
        cell?.viewModel = cellViewModel
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension LeaguesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(sectionViewModel.rows[indexPath.row].cellHeight)
    }
}

//MARK: - LeagueViewInputProtocol
extension LeaguesViewController: LeaguesViewInputProtocol {
    func reloadData(for section: LeagueSectionViewModel) {
        sectionViewModel = section
        tableView.reloadData()
    }
}
