//
//  ViewController.swift
//  GPULearnSW
//
//  Created by liuming on 2018/9/25.
//  Copyright © 2018年 yoyo. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {
    private let filterManager = GPUFilterManager.init()
    private let renderView = RenderView.init(frame: CGRect.init(x: 0, y: 0, width: 320, height: 320))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.renderView)
        self.renderView.frame =  self.view.bounds
        do {
            let camera = try Camera(sessionPreset: .hd1280x720,
                                        cameraDevice: nil,
                                        location: .backFacing,
                                        captureAsYUV: true)
            filterManager.setInput(input: camera)
            filterManager.setOutput(output: self.renderView)
            filterManager.addFilter(filter: FalseColor())
            camera.startCapture()
        } catch let error {
            
            print("error = \(error)")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

