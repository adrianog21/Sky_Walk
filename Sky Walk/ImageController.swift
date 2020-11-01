//
//  InfoController.swift
//  Sky Walk
//
//  Created by Adriano Gatto on 13/12/2019.
//  Copyright © 2019 Adriano Gatto. All rights reserved.
//

import Foundation
import UIKit

class ImageController : UIViewController {
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet var modalView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let earthImages = [#imageLiteral(resourceName: "maxresdefault.jpg"), #imageLiteral(resourceName: "earth1.jpg"), #imageLiteral(resourceName: "earth2.jpg"), #imageLiteral(resourceName: "earth3.jpg"), #imageLiteral(resourceName: "maxxx.jpg"), #imageLiteral(resourceName: "max1.jpg"), #imageLiteral(resourceName: "max23.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        exitButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
    }
    
    @objc func closeModal()  {
        self.dismiss(animated: true)
    }
}

extension ImageController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return earthImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "earthCell", for: indexPath) as! PlanetCollectionViewCell
        cell.planetImageView.image = earthImages[indexPath.row]
        cell.planetImageView.frame = collectionView.frame
        cell.planetImageView.contentMode = UIView.ContentMode.scaleAspectFill
//        cell.sizeToFit()
//        cell.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    
}

