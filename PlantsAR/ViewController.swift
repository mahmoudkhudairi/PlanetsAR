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
        let earthNode = SCNNode(geometry: SCNSphere(radius: 0.2))
        earthNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Earth day") 
        earthNode.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "Earth Specular")
        earthNode.geometry?.firstMaterial?.emission.contents = #imageLiteral(resourceName: "Earth Emission")
        earthNode.geometry?.firstMaterial?.normal .contents = #imageLiteral(resourceName: "Earth Normal")
        earthNode.position = SCNVector3(0,0,-1)
        self.sceneView.scene.rootNode.addChildNode(earthNode)
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8)
        let forever = SCNAction.repeatForever(action)
        earthNode.runAction(forever)
        
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
