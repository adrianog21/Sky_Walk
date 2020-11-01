//
//  ARViewController.swift
//  Sky Walk
//
//  Created by Adriano Gatto on 11/12/2019.
//  Copyright © 2019 Adriano Gatto. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {

    
    @IBOutlet var sceneView: ARSCNView!
    
//    var earthNode = SCNNode()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        let scene = SCNScene(named: "art.scnassets/ARMainScene.scn")!
        sceneView.scene = scene
        
//        let rootNode = sceneView.scene.rootNode
//        earthNode = (rootNode.childNode(withName: "Earth reference", recursively: false))!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
    
//    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
//        let earth = SCNSphere(radius: 0.3)
//        earth.firstMaterial?.diffuse.contents = earthNode.childNodes.first
//        node.geometry = earth
//    }

    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {

        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }

    }
}



    


