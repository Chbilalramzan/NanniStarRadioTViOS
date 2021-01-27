//
//  ContactusViewController.swift
//  NanniStarRadioTV
//
//  Created by Bilal Ramzan on 05/04/2019.
//  Copyright © 2019 Bilal Ramzan. All rights reserved.
//

import UIKit

class ContactusViewController: UIViewController {

    @IBOutlet weak var bottomTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = CustomColors(withFrame: view.frame).getBackgroundColor()
        
        bottomTextView.backgroundColor = UIColor(red: 2/255, green: 118/255, blue: 231/255, alpha: 0.5)
        
      bottomTextView.layer.cornerRadius = bottomTextView.layer.frame.height/4
        

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func onButtonBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
