//
//  ViewController.swift
//  NanniStarRadioTV
//
//  Created by Bilal Ramzan on 03/04/2019.
//  Copyright © 2019 Bilal Ramzan. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class LiveTVViewController: UIViewController {

    var player: AVPlayer?
    let avPlayerViewControll = AVPlayerViewController()
    
    @IBOutlet weak var buttonColor: UIButton!
    @IBOutlet weak var videoText: UITextView!
    @IBOutlet weak var viewcolor: UIView!
    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProperties()
        activityLoader.startAnimating()
        if CheckConnection.Connection() {
            playVideo()
        }
        else{
            activityLoader.stopAnimating()
            self.Alert(Message: "Your device is Not Connected with Internet!")

        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setUpProperties() {
        //set layout background colour
        view.backgroundColor = CustomColors(withFrame: view.frame).getBackgroundColor()
        
        buttonColor.backgroundColor = UIColor(red: 2/255, green: 118/255, blue: 231/255, alpha: 0.5)
        buttonColor.layer.cornerRadius = buttonColor.layer.frame.height/8 
        
        videoText.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 44/255, alpha: 1)
        
        viewcolor.backgroundColor = UIColor (red: 26/255, green: 34/255, blue: 44/255, alpha: 1)
        
    }

    @IBAction func onButtonBackPressed(_ sender: Any) {
    navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func onPressOpenYoutube(_ sender: Any) {
        let youtubeId = "https://www.youtube.com/channel/UCzBomP-uBt8O2MHVXHaTWCg"
        let youtubeurl = URL(string: youtubeId)
            UIApplication.shared.open(youtubeurl!, options: [:], completionHandler: nil)
        
    }
    
    func Alert(Message: String) {
        
        let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertController.Style.alert )
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func playVideo() {
    
        let url1 = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
//        let url = "https://59583158c050f.streamlock.net:443/7042/7042/playlist.m3u8"
        
        
        let videoURL = NSURL(string: url1)
        
        // initialize the video player with the url
        
        player = AVPlayer(url: videoURL! as URL)
      
        avPlayerViewControll.player = player

         // make the layer the same size as the container view
        avPlayerViewControll.view.frame = videoPlayerView.bounds
        
        addChild(avPlayerViewControll)
//
        // add the layer to the container view
        videoPlayerView.addSubview(avPlayerViewControll.view)
        
        avPlayerViewControll.didMove(toParent: self)
        
        player?.play()
        player?.volume = 1.0
        activityLoader.stopAnimating()
        
    }
}

