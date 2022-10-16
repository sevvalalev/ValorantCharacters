//
//  AbilitiesView.swift
//  ValorantCharacters
//
//  Created by Sevval Alev on 13.10.2022.
//

import UIKit
import SDWebImage

class AbilitiesView: UIView {

    
    @IBOutlet weak var abilitiesView: UIView!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var abilitiesImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    
    func configure(imagePath: String?, detail: String) {
        abilitiesLabel?.text = detail
        guard let imagePath = imagePath else {return}
        abilitiesImageView?.sd_setImage(with: URL(string: imagePath))
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed("AbilitiesView", owner: self, options: nil)//we loaded the XIB by name from memory
        addSubview(abilitiesImageView)//added the content view that we dragged in as an outlet as a subview
        abilitiesImageView.frame = self.bounds// positioned the content view to take up the entire view’s appearance.
        abilitiesImageView.frame = CGRect(x: 0, y: 0, width: 220, height: 247)
        addSubview(abilitiesLabel)
        
        
    }
    
}
