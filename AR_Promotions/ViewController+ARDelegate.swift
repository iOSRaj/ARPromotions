//
//  ViewController+ARSCNDelegate.swift
//  AR_Promotions
//
//  Created by Rajkumar Kothandaraman on 6/29/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit
import ARKit

extension ViewController: ARSCNViewDelegate {

func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    guard let imageAnchor = anchor as? ARImageAnchor else { return }
    let referenceImage = imageAnchor.referenceImage
    updateQueue.async {
        _ = referenceImage.name ?? ""
        let videoNode = SKVideoNode(fileNamed: "tx.mp4")
        videoNode.play()
        
        let skScene = SKScene(size: CGSize(width: 600, height: 380))
        skScene.addChild(videoNode)
        
        videoNode.position = CGPoint(x: skScene.size.width / 2, y: skScene.size.height / 2)
        videoNode.size = skScene.size
        
        
        let tvPlane = SCNPlane(width: 0.8, height: 0.5)
        tvPlane.firstMaterial?.diffuse.contents = skScene //TODO: use AVPlayer
        tvPlane.firstMaterial?.isDoubleSided = true
        
        let tvPlaneNode = SCNNode(geometry: tvPlane)
        tvPlaneNode.eulerAngles.x = .pi / 2
        
        node.addChildNode(tvPlaneNode)
    }
    
    // Display video
    DispatchQueue.main.async {
       
    }

  }

}
