//
//  CharacterCell.swift
//  ValorantCharacters
//
//  Created by Sevval Alev on 12.10.2022.
//

import UIKit
import SDWebImage

class CharacterCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var displayIconImageView: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        prepareUI()
    }

    func prepareUI(){
        descriptionLabel.font = descriptionLabel.font.withSize(14)
        displayNameLabel.font = descriptionLabel.font.withSize(20)
    }
    
    func configure(with model: Data?) {
        guard let model = model else {
            return
        }
    
        displayNameLabel.text = model.displayName
        descriptionLabel.text = model.description
        displayIconImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        guard let imageUrl = model.displayIcon else { return }
        displayIconImageView.sd_setImage(with: URL(string: imageUrl))
        
    }
}
