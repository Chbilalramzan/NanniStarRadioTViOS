//
//  SplashScreen.swift
//  NanniStarRadioTV
//
//  Created by Bilal Ramzan on 03/04/2019.
//  Copyright © 2019 Bilal Ramzan. All rights reserved.
//

import UIKit

class SplashScreen: UIViewController {
    
    var timer = Timer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showMenuView()

        // Do any additional setup after loading the view.
    }
    
    //Hide Status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
     //View next Screen after Splash screen
    func showMenuView() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3)
            {
                self.performSegue(withIdentifier: "mainmenuscreen", sender: nil)
            }
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
