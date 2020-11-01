//
//  GameViewController.swift
//  Sky Walk
//
//  Created by Adriano Gatto on 09/12/2019.
//  Copyright © 2019 Adriano Gatto. All rights reserved.
//

import UIKit
import SceneKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController {
    
    var sceneView:SCNView!
    var scene:SCNScene!
    var viewOpen = true
    
    var audioPlayer: AVAudioPlayer?
    
//     let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    
    //NODES
    var sliceNode = SCNNode()
    var sliceNodeChild = SCNNode()
    var moonNode = SCNNode()
    var moonReference = SCNNode()
    var moonSlice = SCNNode()
    var touchSphere = SCNNode()
    var moonCamera = SCNNode()
    var touchSphere2 = SCNNode()
    var moonCamera2 = SCNNode()
//    var stickCamera = SCNNode()
    var cameraNode = SCNNode()
    let camera = SCNCamera()
    
    var sectionNode = SCNNode()
    var sectionNodeChild = SCNNode()
    var sectionNodeChild2 = SCNNode()
    var sectionNodeChild3 = SCNNode()
    var sectionCameraNode = SCNNode()
    var sectionCameraPositionNode = SCNNode()
    
    var earthCameraNode = SCNNode()

    
    //Outlets
    @IBOutlet weak var sectionButtonEarth: UIButton!
    @IBOutlet weak var audioButton: UIButton!
    @IBOutlet weak var audioOff: UILabel!
    @IBOutlet weak var infoButtonEarth: UIButton!
    @IBOutlet weak var moonView: UIView!
    @IBOutlet weak var earthView: UIView!
    @IBOutlet weak var planetLabel: UILabel!
    @IBOutlet weak var planetButtonsView: UIView!
    @IBOutlet weak var planetInfoView: UIView!
    
    let earthCameraPosition = SCNVector3(0, 2, 0)
    let earthEulers = SCNVector3(x: -0.34906584, y: -0.0, z: 0.0)
    
    var audioIsOn = true
    var sectionOn = false
    var moonSectionOn = false
    
    var followMoon = false
    
    @IBOutlet weak var gameScene: SCNView!
    
    
    //VIEWDIDLOAD
       override func viewDidLoad() {
           setupScene()
        
            let music = Bundle.main.path(forResource: "art.scnassets/Audio/skywalkSong.mp3", ofType: nil)
        let url = URL(fileURLWithPath: music!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()

        } catch {
            print(error)
        }
            audioOff.isHidden = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        sceneView.addGestureRecognizer(tapGesture)
    }
       
    //create Nodes
    fileprivate func createNodes() {
        
        let rootNode = sceneView.scene?.rootNode
        
        sectionNode = (rootNode?.childNode(withName: "Earth section", recursively: false))!
        sectionNodeChild = (sectionNode.childNode(withName: "Earth Section", recursively: false))!
        sectionNodeChild2 = (sectionNodeChild.childNode(withName: "earthSection reference", recursively: false))!
        sectionNodeChild3 = (sectionNodeChild2.childNode(withName: "default", recursively: false))!
        
        sectionCameraPositionNode = (rootNode?.childNode(withName: "section position", recursively: false))!
        sectionCameraNode = (sectionCameraPositionNode.childNode(withName: "section camera", recursively: false))!
        
        moonNode = (rootNode?.childNode(withName: "MoonNode", recursively: false))!
        moonReference = (moonNode.childNode(withName: "Moon reference", recursively: false))!
        moonSlice = (moonReference.childNode(withName: "sphere", recursively: false))!
        
        touchSphere = (moonNode.childNode(withName: "touchSphere", recursively: false))!
        moonCamera = (touchSphere.childNode(withName: "moonCamera", recursively: false))!
        
        touchSphere2 = (moonNode.childNode(withName: "touchSphere2", recursively: false))!
        moonCamera2 = (touchSphere2.childNode(withName: "moonCamera2", recursively: false))!

        
        cameraNode = (rootNode?.childNode(withName: "MainCamera", recursively: false))!
        
        sliceNode = (rootNode?.childNode(withName: "Earth slice", recursively: false))!
        sliceNodeChild = (sliceNode.childNode(withName: "Earth Slice", recursively: false))!
    }
    
    func setupScene(){
        sceneView = gameScene
           sceneView.allowsCameraControl = true
           scene = SCNScene(named: "art.scnassets/MainScene.scn")
           sceneView.scene = scene
        
        createNodes()
        self.planetButtonsView.transform = CGAffineTransform(translationX: 100, y: 0)
        self.planetInfoView.transform = CGAffineTransform(translationX: 0, y: -100)
        earthView.isHidden = true
        moonView.isHidden = true
       }
    
    
    @IBAction func offAudio(_ sender: Any) {
        if audioIsOn {
            audioOff.isHidden = false
            audioIsOn = false
            audioPlayer?.stop()
        }else{
            audioOff.isHidden = true
            audioIsOn = true
            audioPlayer?.play()
        }
    }
    
    
    //SECTION ANIMATION
    @IBAction func sectionEarthAnimation(_ sender: Any) {
        if sectionOn == false {
            UIView.animate(withDuration: 1)
            {
                self.planetInfoView.transform = CGAffineTransform(translationX: 0, y: -100)
            }
            sliceNode.runAction(SCNAction.scale(to: 0, duration: 2))
            sceneView.allowsCameraControl = false
            sectionOn = true
            
        }else if sectionOn == true
        {
            UIView.animate(withDuration: 1)
            {
                self.planetInfoView.transform = CGAffineTransform.identity
            }
            cameraNode.position = earthCameraPosition
            cameraNode.eulerAngles = earthEulers
            sliceNode.runAction(SCNAction.scale(to: 0.5, duration: 2))
            sceneView.allowsCameraControl = true
            sectionOn = false
        }
    }
    
    @IBAction func MoonSectionAnimation(_ sender: Any) {
        if moonSectionOn == false {
            UIView.animate(withDuration: 1)
            {
                self.planetInfoView.transform = CGAffineTransform(translationX: 0, y: -100)
            }
            moonSlice.runAction(SCNAction.scale(to: 0, duration: 2))
            sceneView.allowsCameraControl = false
            moonSectionOn = true
            
        }else if moonSectionOn == true
        {
            UIView.animate(withDuration: 1)
            {
                self.planetInfoView.transform = CGAffineTransform.identity
            }
//            cameraNode.position = earthCameraPosition
//            cameraNode.eulerAngles = earthEulers
            moonSlice.runAction(SCNAction.scale(to: 1.01, duration: 2))
            sceneView.allowsCameraControl = true
            moonSectionOn = false
        }
    }
    
    
    
    
    
    func closeView(){
        UIView.animate(withDuration: 1){
            self.planetButtonsView.transform = CGAffineTransform(translationX: 100, y: 0)
            self.planetInfoView.transform = CGAffineTransform(translationX: 0, y: -100)
        }
    }
    
    func openView(){
        UIView.animate(withDuration: 0.5){
            self.planetButtonsView.transform = CGAffineTransform.identity
            self.planetInfoView.transform = CGAffineTransform.identity

        }
    }
    
    @IBAction func backViewCamera(_ sender: Any) {
        cameraNode.runAction(SCNAction.move(to: SCNVector3(0, 5, 10), duration: 0.5))
        cameraNode.runAction(SCNAction.rotateTo(x: CGFloat(earthEulers.x), y: CGFloat(earthEulers.y), z: CGFloat(earthEulers.z), duration: 0.5))
//        cameraNode.eulerAngles = earthEulers
        closeView()
        followMoon = false
        
    }
    
    
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return .landscapeLeft
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    
       @objc func handleTap(sender: UITapGestureRecognizer)
       {
           let tapView = sender.view as! SCNView
                       let touchLocation = sender.location(in: tapView)
                       let hitTest = tapView.hitTest(touchLocation, options: nil)
                       if !hitTest.isEmpty{
                       let result = hitTest.first?.node.name
                        if result == "default"
                        {
                            cameraNode.runAction(SCNAction.move(to: earthCameraPosition, duration: 0.5))
                            cameraNode.runAction(SCNAction.rotateTo(x: CGFloat(earthEulers.x), y: CGFloat(earthEulers.y), z: CGFloat(earthEulers.z), duration: 0.5))
                            planetLabel.text = "Earth"
                            openView()
                            moonView.isHidden = true
                            earthView.isHidden = false
                            
                        }
                        else if result == "touchSphere"
                        {
                            followMoon = true
                            planetLabel.text = "Moon"
                            openView()
                            moonView.isHidden = false
                            earthView.isHidden = true
                            print("ko")
                        }else{
                            print("\(String(describing: result))")

                        }
                       }
       }

}

extension GameViewController: SCNSceneRendererDelegate {
    
  // 2
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {

        if sectionOn == true && followMoon == false {
            sceneView.pointOfView = sectionCameraNode
            sceneView.allowsCameraControl = true
//         sceneView.pointOfView = sectionCameraNode
            }else if sectionOn == false && followMoon == false {
            sceneView.pointOfView = cameraNode
            sceneView.allowsCameraControl = true
        } else if followMoon == true && sectionOn == false {
            sceneView.pointOfView = moonCamera2
            sceneView.allowsCameraControl = false
        }
        if followMoon == true && moonSectionOn == true {
            sceneView.pointOfView = moonCamera
        }else if followMoon == true && moonSectionOn == false {
            sceneView.pointOfView = moonCamera2
        }
  }
}
