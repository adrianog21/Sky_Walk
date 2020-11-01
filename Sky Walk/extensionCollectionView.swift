//
//  extensionCollectionView.swift
//  Sky Walk
//
//  Created by Adriano Gatto on 15/12/2019.
//  Copyright © 2019 Adriano Gatto. All rights reserved.
//

import UIKit

extension ImageController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return earthImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "earthCell", for: indexPath) as! PlanetCollectionViewCell
        cell.planetImageView.image = earthImages[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
}
