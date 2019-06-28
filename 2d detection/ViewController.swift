//
//  ViewController.swift
//  Abgabe CC6 2019
//
//  Created by Christopher Brembach on 05.06.19
//  Copyright © 2019 Christopher Brembach. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var K: UILabel!
    
    @IBOutlet weak var R: UILabel!
    
    @IBOutlet weak var O: UILabel!
    
    @IBOutlet weak var N: UILabel!
    
    @IBOutlet weak var E: UILabel!
    
    @IBOutlet weak var holIhnDir: UIButton!
    
    @IBAction func zurück(_ sender: Any) {
    }
    
    @IBAction func mapslink(_ sender: Any) {
    }
    /*@IBAction func show(sender: AnyObject) {
        /*if K.isHidden // condition to check if the button is hidden -
            {
                K.isHidden = true // set the button to be visible
        }*/
       
    }*/
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        K.isHidden = true
        R.isHidden = true
        O.isHidden = true
        N.isHidden = true
        E.isHidden = true
        holIhnDir.isHidden = true
        
        func zurück(_ sender: Any) {
            holIhnDir.isHidden = false
        }
    
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/game.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        //let configuration = ARWorldTrackingConfiguration()

        guard let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "Photos", bundle: nil) else {
            print("No images available")
            return
        }
        
        ////
        configuration.trackingImages = trackedImages
        //configuration.detectionImages = trackedImages
        //configuration.maximumNumberOfTrackedImages = 2

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

//
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
         
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 0, alpha: 0.0)
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
        
            if case imageAnchor.referenceImage.name = "1"{
                K.isHidden = false
            }
            if case imageAnchor.referenceImage.name = "2"{
                R.isHidden = false
            }
            if case imageAnchor.referenceImage.name = "3"{
                O.isHidden = false
            }
            if case imageAnchor.referenceImage.name = "4"{
                N.isHidden = false
            }
            if case imageAnchor.referenceImage.name = "5"{
                E.isHidden = false
            }
            if E.isHidden == false && K.isHidden == false && R.isHidden == false && O.isHidden == false && N.isHidden == false {
                holIhnDir.isHidden = false
            }
            
        switch imageAnchor.referenceImage.name {
        case "1" :
                let ship1Scene = SCNScene(named: "art.scnassets/102.scn")!
                let ship1Node = ship1Scene.rootNode.childNodes.first!
                ship1Node.position = SCNVector3Zero
                ship1Node.position.z = 0.01
                //ship1Node.position.x = 0.15
                
                planeNode.addChildNode(ship1Node)
                node.addChildNode(planeNode)
            
            
             case "2" :
             let ship2Scene = SCNScene(named: "art.scnassets/1003.scn")!
             let ship2Node = ship2Scene.rootNode.childNodes.first!
             ship2Node.position = SCNVector3Zero
             ship2Node.position.z = 0.00
             //ship2Node.position.x = 0.15
             
             planeNode.addChildNode(ship2Node)
             node.addChildNode(planeNode)
             
            case "3" :
                let ship3Scene = SCNScene(named: "art.scnassets/1004.scn")!
                let ship3Node = ship3Scene.rootNode.childNodes.first!
                ship3Node.position = SCNVector3Zero
                ship3Node.position.z = 0.01
                //ship3Node.position.x = 0.15
                
                planeNode.addChildNode(ship3Node)
                node.addChildNode(planeNode)
                
                
                
            case "4" :
                let ship4Scene = SCNScene(named: "art.scnassets/1005.scn")!
                let ship4Node = ship4Scene.rootNode.childNodes.first!
                ship4Node.position = SCNVector3Zero
                ship4Node.position.z = 0.01
                //ship4Node.position.x = 0.15
                
                planeNode.addChildNode(ship4Node)
                node.addChildNode(planeNode)
                
            case "5" :
                let ship5Scene = SCNScene(named: "art.scnassets/1001.scn")!
                let ship5Node = ship5Scene.rootNode.childNodes.first!
                ship5Node.position = SCNVector3Zero
                ship5Node.position.z = 0.01
                //ship5Node.position.x = 0.15
                
                planeNode.addChildNode(ship5Node)
                node.addChildNode(planeNode)
                
                
            case .none:
                print("nothing found")
            case .some(_):
                print("multiple found")
               
            }
            
            /*let shipScene = SCNScene(named: "art.scnassets/ship.scn")!
            let shipNode = shipScene.rootNode.childNodes.first!
            shipNode.position = SCNVector3Zero
            shipNode.position.z = 0.15
            
            planeNode.addChildNode(shipNode)
            
            
            node.addChildNode(planeNode)*/
    
                
            
            /*if imageAnchor.referenceImage.name == "IMG_1866" {
                // Set AVPlayer as the plane's texture and play
             // nach oben ziehen und nur plane node placen?
             let shipScene = SCNScene(named: "art.scnassets/ship.scn")!
                let shipNode = shipScene.rootNode.childNodes.first!
                shipNode.position = SCNVector3Zero
                shipNode.position.z = 0.15
                
                planeNode.addChildNode(shipNode)
                
            } else if imageAnchor.referenceImage.name == "IMG_1867" {
                let ship2Scene = SCNScene(named: "art.scnassets/ship.scn")!
                let ship2Node = ship2Scene.rootNode.childNodes.first!
                ship2Node.position = SCNVector3Zero
                ship2Node.position.z = 0.15
                
                planeNode.addChildNode(ship2Node)
            }*/
 
            
        }
    return node
    }
}
