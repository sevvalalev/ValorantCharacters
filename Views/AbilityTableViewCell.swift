//
//  AbilityTableViewCell.swift
//  ValorantCharacters
//
//  Created by Sevval Alev on 21.10.2022.
//

import UIKit

class AbilityTableViewCell: UITableViewCell {
    
    static let identifier = "abilityCell"
    
    private let abilityImageView: UIImageView = {
        let _abilityImageView = UIImageView()
        _abilityImageView.translatesAutoresizingMaskIntoConstraints = false
        return _abilityImageView
    }()
    
    private let abilityLabel: UILabel = {
       let _abilityLabel = UILabel()
        _abilityLabel.numberOfLines = 0
        _abilityLabel.font = .preferredFont(forTextStyle: .body)
        _abilityLabel.translatesAutoresizingMaskIntoConstraints = false
        return _abilityLabel
    }()
    
    private let abilityContentView: UIView = {
        let _abilityContentView = UIView()
        _abilityContentView.translatesAutoresizingMaskIntoConstraints = false
        _abilityContentView.layer.cornerRadius = 20
        return _abilityContentView
    }()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareConstraint()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configure(ability: Abilities?) {
        guard let ability = ability else {
            return
        }
        
        if let url = URL(string: ability.displayIcon ?? "") {
            abilityImageView.sd_setImage(with: url)
        }
        abilityLabel.text = ability.description
    }
}

//MARK: - Constraints
extension AbilityTableViewCell {
    private func prepareConstraint() {
        
        addSubview(abilityContentView)
        NSLayoutConstraint.activate([
            abilityContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            abilityContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            abilityContentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            abilityContentView.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        ])
        
        abilityContentView.addSubview(abilityImageView)
        NSLayoutConstraint.activate([
            abilityImageView.heightAnchor.constraint(equalToConstant: 80),
            abilityImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            abilityImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            abilityImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        abilityContentView.addSubview(abilityLabel)
        NSLayoutConstraint.activate([
            abilityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            abilityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            abilityLabel.leadingAnchor.constraint(equalTo: abilityImageView.trailingAnchor, constant: 16),
            abilityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            abilityLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
