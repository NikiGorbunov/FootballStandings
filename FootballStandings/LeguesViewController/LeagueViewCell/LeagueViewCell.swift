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

class LeagueViewCell: UITableViewCell {
    
    private lazy var namelabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var abbrLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.abbrFont
        label.textColor = Constants.abbrColor
        return label
    }()
    
    private lazy var logo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    func configure(model: League) {
        namelabel.text = model.name
        abbrLabel.text = model.abbr
        
        configure()
    }
    
    private func configure() {
        selectionStyle = .none
        addSubview()
        makeConstraints()
    }
    
    private func addSubview() {
        addSubview(namelabel)
        addSubview(abbrLabel)
        
    }
    
    private func makeConstraints() {
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        abbrLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            namelabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.nameLeftInset),
            namelabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: Constants.nameRightInset),
            namelabel.topAnchor.constraint(equalTo: topAnchor),
            namelabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            abbrLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.abbrLeftInset),
            abbrLabel.topAnchor.constraint(equalTo: centerYAnchor),
            abbrLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
