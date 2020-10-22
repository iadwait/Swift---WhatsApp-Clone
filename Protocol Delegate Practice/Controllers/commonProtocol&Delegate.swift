//
//  commonProtocol&Delegate.swift
//  Protocol Delegate Practice
//
//  Created by Adwait Barkale on 21/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation


protocol testingProtocol {
    func whoCalledMe()
    func myInstance(_ commonProtocolDelegate: common_Protocol_Delegate)
}

struct common_Protocol_Delegate {
    
    var delegate: testingProtocol?
    
    func startProcess()
    {
        
    }
    
}
