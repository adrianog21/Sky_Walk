//
//  sceneController.swift
//  Sky Walk
//
//  Created by Adriano Gatto on 09/12/2019.
//  Copyright © 2019 Adriano Gatto. All rights reserved.
//

import UIKit
import SpriteKit

class sceneController : SKScene {

    
    var lbl = SKLabelNode()
    
    convenience init (scenesize: CGSize){
        self.init(size: scenesize)
       
       lbl.text = "ciao"
       lbl.fontSize = 64
       lbl.fontColor = UIColor.red
       lbl.position = CGPoint(x: scenesize.self.width / 2, y: scenesize.self.height - 72)
        
   }
    func newlabel(){
        self.addChild(lbl)
    }
}
