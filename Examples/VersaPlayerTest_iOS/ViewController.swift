//
//  ViewController.swift
//  VersaPlayerTest_ios
//
//  Created by Jose Quintero on 11/5/18.
//  Copyright © 2018 Quasar Studio. All rights reserved.
//

import UIKit
import VersaPlayer

class ViewController: UIViewController {
    
    @IBOutlet weak var playerView: VersaPlayerView!
    @IBOutlet weak var controls: VersaPlayerControls!
    @IBOutlet weak var dummyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dummyView.alpha = 0.0
        
        
        playerView.layer.backgroundColor = UIColor.black.cgColor
        playerView.use(controls: controls)

        
        
        
        if let url = URL.init(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8") {
            let item = VersaPlayerItem(url: url)
            playerView.set(item: item)
            let behavior = VersaPlayerControlsBehaviour(with: controls)
            behavior.activationBlock = { (ctrls) -> Void in
                
            }
            
            controls.behaviour = behavior
            
            controls.behaviour.activationBlock = { (controls) -> Void in
                UIView.animate(withDuration: 0.3) {
                    controls.alpha = 1.0
                    self.dummyView.alpha = 0.0
                }
            }
            
            controls.behaviour.deactivationBlock = { (controls) -> Void in
                UIView.animate(withDuration: 0.3) {
                    controls.alpha = 0.0
                    self.dummyView.alpha = 1.0
                }
            }
        }
    }
}

