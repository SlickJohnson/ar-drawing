//
//  ViewController.swift
//  ARDrawing
//
//  Created by Willie Johnson on 9/27/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
  @IBOutlet weak var sceneView: ARSCNView!
  let configuration = ARWorldTrackingConfiguration()

  override func viewDidLoad() {
    super.viewDidLoad()
    sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
    sceneView.showsStatistics = true
    sceneView.session.run(configuration)
    sceneView.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

// MARK: ARSCNViewDelegate
extension ViewController: ARSCNViewDelegate {
  func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
    guard let pointOfView = sceneView.pointOfView else { return }
    let transform = pointOfView.transform
    let orientation = SCNVector3(transform.m31, transform.m32, transform.m33)
    let location = SCNVector3(transform.m41, transform.m42, transform.m43)
    let currentPositionOfCamera = orientation + location
    print(orientation.x, orientation.y, orientation.z)
  }
}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
  return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
