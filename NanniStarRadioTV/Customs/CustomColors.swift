//
//  CustomColors.swift
//  NanniStarRadioTV
//
//  Created by Bilal Ramzan on 05/04/2019.
//  Copyright © 2019 Bilal Ramzan. All rights reserved.
//

import Foundation

import UIKit

struct CustomColors{
    
    let backgroundColor : UIColor!
//    var buttonColor : UIColor!
//    let foregroundColor : UIColor!
//    
    
    
    init(withFrame: CGRect) {
        
//let btnColor = UIColor(hexString: "#276E7" , withAlpha: 1)
//        let fgColor = UIColor(hexString: "#1A222C", withAlpha: 1)
//
        
        backgroundColor = UIColor(red: 14/255, green: 17/255, blue: 26/255, alpha: 1)
        
        
    }
    
    func getBackgroundColor() -> UIColor {
        
        return backgroundColor 
    }
    
}
