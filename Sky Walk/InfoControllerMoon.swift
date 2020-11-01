//
//  InfoController.swift
//  Sky Walk
//
//  Created by Adriano Gatto on 13/12/2019.
//  Copyright © 2019 Adriano Gatto. All rights reserved.
//

import Foundation
import UIKit

class InfoController : UIViewController {
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet var modalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exitButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
    }
    
    @objc func closeModal()  {
        self.dismiss(animated: true)
    }
}
