//
//  LeagueViewCell.swift
//  FootballStandings
//
//  Created by Никита Горбунов on 13.07.2022.
//

import UIKit

private extension LeagueViewCell {
    struct Constants {
        static let abbrFont = UIFont.systemFont(ofSize: 12)
        static let abbrColor = UIColor.gray
        static let nameLeftInset: CGFloat = 10
        static let nameRightInset: CGFloat = 50
        static let abbrLeftInset: CGFloat = 10
        static let logoLeftInset: CGFloat = 50
        static let logoRightInset: CGFloat = -10
    }
}

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class LeagueViewCell: UITableViewCell, CellModelRepresentable {
    
    private lazy var nameLeagueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var abbrLeagueLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.abbrFont
        label.textColor = Constants.abbrColor
        return label
    }()
    
    private lazy var leagueImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    var viewModel: CellIdentifiable? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? LeagueViewCellModel else { return }
        nameLeagueLabel.text = viewModel.leagueName
        abbrLeagueLabel.text = viewModel.leagueAbbr
        leagueImage.loadImage(urlString: viewModel.imageURL)
            
        configure()

    }
    
    private func configure() {
        selectionStyle = .none
        addSubview()
        makeConstraints()
    }
    
    private func addSubview() {
        addSubview(nameLeagueLabel)
        addSubview(abbrLeagueLabel)
        
    }
    
    private func makeConstraints() {
        nameLeagueLabel.translatesAutoresizingMaskIntoConstraints = false
        abbrLeagueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLeagueLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.nameLeftInset),
            nameLeagueLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: Constants.nameRightInset),
            nameLeagueLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLeagueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            abbrLeagueLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.abbrLeftInset),
            abbrLeagueLabel.topAnchor.constraint(equalTo: centerYAnchor),
            abbrLeagueLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
