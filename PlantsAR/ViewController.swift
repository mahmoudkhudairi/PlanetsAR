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
        let sunNode = SCNNode(geometry: SCNSphere(radius: 0.35))
        let earthParent = SCNNode()
         let venusParent = SCNNode()
        sunNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun diffuse")
        sunNode.position = SCNVector3(0,0,-1)
        earthParent.position = SCNVector3(0,0,-1)
        venusParent.position = SCNVector3(0,0,-1)
        self.sceneView.scene.rootNode.addChildNode(sunNode)
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        let earthNode = planet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "Earth day"), specular: #imageLiteral(resourceName: "Earth Specular"), emission: #imageLiteral(resourceName: "Earth Emission"), normal: #imageLiteral(resourceName: "Earth Normal"), position: SCNVector3(1.2,0,0))
        let venusNode = planet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Venus Surface"), specular: nil, emission: #imageLiteral(resourceName: "Venus Atmosphere"), normal:nil, position: SCNVector3(0.7,0,0))
        venusParent.addChildNode(venusNode)
        earthParent.addChildNode(earthNode)
        
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        let forever = SCNAction.repeatForever(action)
        sunNode.runAction(forever)
        
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
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
  
}
extension Int{
    var degreesToRadians: Double{return Double(self) * .pi / 180}
}
