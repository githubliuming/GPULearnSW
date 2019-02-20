//
//  GPUFilterManager.swift
//  GPULearnSW
//
//  Created by liuming on 2018/9/25.
//  Copyright © 2018年 yoyo. All rights reserved.
//

import Foundation
import GPUImage
open class GPUFilterManager:NSObject {
    private var intput:ImageSource?
    private var outPut:ImageConsumer?
    private var lastFilter:ImageSource?
    public override init() {
        super.init()
    }
    
    open func setInput(input:ImageSource){
        self.intput = input
        self.lastFilter = input
    }
    open func setOutput(output:ImageConsumer) {
        self.outPut = output
    }
    open func addFilter(filter:ImageProcessingOperation){
        guard let _ = self.intput, let oput = self.outPut else {
            return
        }
        self.lastFilter?.addTarget(filter)
        filter.addTarget(oput)
        self.lastFilter = filter
    }
    
}
