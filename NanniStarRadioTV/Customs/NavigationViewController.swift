//
//  NavigationViewController.swift
//  NanniStarRadioTV
//
//  Created by Bilal Ramzan on 04/04/2019.
//  Copyright © 2019 Bilal Ramzan. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        makeBarInvisible()
        // Do any additional setup after loading the view.
        
    }
    
    func makeBarInvisible() {
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    

}
