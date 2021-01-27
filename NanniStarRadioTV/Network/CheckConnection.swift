//
//  CheckConnection.swift
//  NanniStarRadioTV
//
//  Created by Bilal Ramzan on 14/04/2019.
//  Copyright © 2019 Bilal Ramzan. All rights reserved.
//

import Foundation
import SystemConfiguration

public class CheckConnection{
    
    class func  Connection() -> Bool {
        
        var ZeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr:
            in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        
        ZeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: ZeroAddress))
        ZeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteResearchability = withUnsafePointer(to: &ZeroAddress ) {
            
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                
                zeroSockAddress in SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        
        if SCNetworkReachabilityGetFlags(defaultRouteResearchability!, &flags) == false
        {
            
            return false
        }
        
        //Working for cellular and wifi
        
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
    
}
