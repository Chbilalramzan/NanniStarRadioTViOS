//
//  MenuViewController.swift
//  NanniStarRadioTV
//
//  Created by Bilal Ramzan on 05/04/2019.
//  Copyright © 2019 Bilal Ramzan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = CustomColors(withFrame: view.frame).getBackgroundColor()
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
