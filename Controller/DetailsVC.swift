//
//  DetailsVC.swift
//  ValorantCharacters
//
//  Created by Sevval Alev on 12.10.2022.
//

import UIKit
import SDWebImage

class DetailsVC: UIViewController {

    var character: Data?
    //MARK: - Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var fullPortraitImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var abilitiesStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI()
        navigationBar()
        navigationController()
    }
    
    //MARK: - Prepare UI
    private func prepareUI() {
        guard let character = character else {
            return
        }
        
        nameLabel.text = character.displayName
        displayNameLabel.text = character.role?.displayName
        descriptionLabel.text = character.description
        // foreach in içinde custom view den nesne oluşturup stack e ekledin
        
        character.abilities?.forEach({ ability in
            let view = AbilitiesView()
            view.configure(imagePath: ability.displayIcon ?? "", detail: ability.description ?? "")
            view.backgroundColor = .darkGray
            abilitiesStackView.addArrangedSubview(view)
        })
        
        fullPortraitImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        guard let imageUrl = character.fullPortrait else { return }
        fullPortraitImageView.sd_setImage(with: URL(string: imageUrl))
        guard let imageUrl = character.background else { return }
        backgroundImageView.sd_setImage(with: URL(string: imageUrl))
    }
    
    //MARK: - Navigation Controller
    func navigationController(){
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .purple
    }
    
    //MARK: - NavigationBar
    func navigationBar() {
        navigationItem.backButtonTitle = "Back"
    }

}


