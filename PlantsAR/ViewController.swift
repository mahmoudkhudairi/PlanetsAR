//
//  ViewController.swift
//  PlantsAR
//
//  Created by mahmoud khudairi on 3/18/18.
//  Copyright © 2018 mahmoud khudairi. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    override func viewDidAppear(_ animated: Bool) {
    
        let sunNode = SCNNode(geometry: SCNSphere(radius: 1))
        let earthParentNode = SCNNode()
        let moonParentNode = SCNNode()
        let mercuryParentNode = SCNNode()
        let venusParentNode = SCNNode()
        let marsParentNode = SCNNode()
        let jupiterParentNode = SCNNode()
        let saturnParentNode = SCNNode()
        let uransParentNode = SCNNode()
        let neptuneParentNode = SCNNode()
        
        
        sunNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun diffuse")
        sunNode.position = SCNVector3(0,0,-8)
        earthParentNode.position = SCNVector3(0,0,-8)
        moonParentNode.position = SCNVector3(3,0,0)
        mercuryParentNode.position = SCNVector3(0,0,-8)
        venusParentNode.position = SCNVector3(0,0,-8)
        marsParentNode.position = SCNVector3(0,0,-8)
        jupiterParentNode.position = SCNVector3(0,0,-8)
        saturnParentNode.position = SCNVector3(0,0,-8)
        uransParentNode.position = SCNVector3(0,0,-8)
        neptuneParentNode.position = SCNVector3(0,0,-8)
        
        
        self.sceneView.scene.rootNode.addChildNode(sunNode)
        self.sceneView.scene.rootNode.addChildNode(earthParentNode)
        self.sceneView.scene.rootNode.addChildNode(mercuryParentNode)
        self.sceneView.scene.rootNode.addChildNode(venusParentNode)
        self.sceneView.scene.rootNode.addChildNode(marsParentNode)
        self.sceneView.scene.rootNode.addChildNode(jupiterParentNode)
        self.sceneView.scene.rootNode.addChildNode(saturnParentNode)
        self.sceneView.scene.rootNode.addChildNode(uransParentNode)
        self.sceneView.scene.rootNode.addChildNode(neptuneParentNode)
        
        
        let mercuryNode = planet(geometry: SCNSphere(radius: 0.126), diffuse: #imageLiteral(resourceName: "mercury difuse") , specular: nil, emission: nil, normal:nil, position: SCNVector3(1.8,0,0))
        let venusNode = planet(geometry: SCNSphere(radius: 0.31), diffuse: #imageLiteral(resourceName: "Venus Surface"), specular: nil, emission: #imageLiteral(resourceName: "Venus Atmosphere"), normal:nil, position: SCNVector3(2.4,0,0))
        let earthNode = planet(geometry: SCNSphere(radius: 0.33), diffuse: #imageLiteral(resourceName: "Earth day"), specular: #imageLiteral(resourceName: "Earth Specular"), emission: #imageLiteral(resourceName: "Earth Emission"), normal: #imageLiteral(resourceName: "Earth Normal"), position: SCNVector3(3,0,0))
        let moonNode = planet(geometry: SCNSphere(radius: 0.09), diffuse: #imageLiteral(resourceName: "moon diffuse"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0,0,-0.6))
        let marsNode = planet(geometry: SCNSphere(radius: 0.176), diffuse: #imageLiteral(resourceName: "mars difuse") , specular: nil, emission: nil, normal:nil, position: SCNVector3(3.8,0,0))
        let jupiterNode = planet(geometry: SCNSphere(radius: 0.8), diffuse: #imageLiteral(resourceName: "jupiter diffuse") , specular: nil, emission: nil, normal:nil, position: SCNVector3(5.4,0,0))
        let saturnNode = planet(geometry: SCNSphere(radius: 0.6), diffuse: #imageLiteral(resourceName: "saturn difuse") , specular: nil, emission: nil, normal:nil, position: SCNVector3(8.5,0,0))
        let saturnRingNode = planet(geometry: SCNTorus(ringRadius: 0.7, pipeRadius: 0.1), diffuse:#imageLiteral(resourceName: "moon diffuse"), specular: nil, emission: #imageLiteral(resourceName: "saturn_ring"), normal: nil, position: SCNVector3(8.5,0,0))
        let uransNode = planet(geometry: SCNSphere(radius: 0.5), diffuse: #imageLiteral(resourceName: "uranus difuse") , specular: nil, emission: nil, normal:nil, position: SCNVector3(10,0,0))
        let neptuneNode = planet(geometry: SCNSphere(radius: 0.376), diffuse:#imageLiteral(resourceName: "neptune difuse") , specular: nil, emission: nil, normal:nil, position: SCNVector3(12.5,0,0))
        
        earthParentNode.addChildNode(earthNode)
        earthParentNode.addChildNode(moonParentNode)
        earthNode.addChildNode(moonNode)
        moonParentNode.addChildNode(moonNode)
        mercuryParentNode.addChildNode(mercuryNode)
        venusParentNode.addChildNode(venusNode)
        marsParentNode.addChildNode(marsNode)
        jupiterParentNode.addChildNode(jupiterNode)
        saturnParentNode.addChildNode(saturnNode)
        saturnParentNode.addChildNode(saturnRingNode)
        uransParentNode.addChildNode(uransNode)
        neptuneParentNode.addChildNode(neptuneNode)
        
        
        let sunRotation = Rotation(time: 5)
        let mercuryParentRotation = Rotation(time: 8)
        let venusParentRotation = Rotation(time: 10)
        let earthParentRotation = Rotation(time: 13)
        let earthRotation = Rotation(time: 13)
        let moonRotation = Rotation(time: 6)
        let marsParentRotation = Rotation(time: 15)
        let jupiterParentRotation = Rotation(time: 18)
        let saturnParentRotation = Rotation(time: 20)
        let uransParentRotation = Rotation(time: 23)
        let neptuneParentRotation = Rotation(time: 25)
        
        sunNode.runAction(sunRotation)
        earthParentNode.runAction(earthParentRotation)
        earthNode.runAction(earthRotation)
        moonParentNode.runAction(moonRotation)
        mercuryParentNode.runAction(mercuryParentRotation)
        venusParentNode.runAction(venusParentRotation)
        marsParentNode.runAction(marsParentRotation)
        jupiterParentNode.runAction(jupiterParentRotation)
        saturnParentNode.runAction(saturnParentRotation)
        uransParentNode.runAction(uransParentRotation)
        neptuneParentNode.runAction(neptuneParentRotation)

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func planet(geometry: SCNGeometry, diffuse: UIImage?,specular:UIImage?,emission: UIImage?,normal:UIImage?, position:SCNVector3) -> SCNNode {
        let plantNode = SCNNode(geometry: geometry)
        plantNode.geometry?.firstMaterial?.diffuse.contents = diffuse
        plantNode.geometry?.firstMaterial?.specular.contents = specular
        plantNode.geometry?.firstMaterial?.emission.contents = emission
        plantNode.geometry?.firstMaterial?.normal .contents = normal
        plantNode.position = position
        
        return plantNode
    }
    func Rotation(time:TimeInterval) -> SCNAction{
        let rotationAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: time)
        let foreverRotation = SCNAction.repeatForever(rotationAction)
        return foreverRotation
    }
    
    
}
extension Int{
    var degreesToRadians: Double{return Double(self) * .pi / 180}
}
