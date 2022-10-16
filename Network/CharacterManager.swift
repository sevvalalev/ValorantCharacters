//
//  CharacterManager.swift
//  ValorantCharacters
//
//  Created by Sevval Alev on 12.10.2022.
//

import Foundation

protocol SendCharacterDataTransferDelegate: AnyObject {
    func sendCharacterData(character: CharacterData)
}
//MARK: - Fetch Data
class CharacterManager {
    
    weak var delegate: SendCharacterDataTransferDelegate?
    
    func characterJson(){
        let url = URL(string: C.URL.characterUrl)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else{return}
                do {
                    let characters = try JSONDecoder().decode(CharacterData.self, from: data)

                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else{return}
                        self.delegate?.sendCharacterData(character: characters)
                    }
                }catch{
                    print("Error fetching \(error.localizedDescription)")
                }
            
            //eğer error varsa da bilgilendirme mesajı
            
        }.resume()
    }
}
