//
//  LiveRadioViewController.swift
//  NanniStarRadioTV
//
//  Created by Bilal Ramzan on 05/04/2019.
//  Copyright © 2019 Bilal Ramzan. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class LiveRadioViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var songImage: UIImageView!
    
    @IBOutlet weak var songName: UITextView!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var volumeControlSlider: UISlider!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var player: AVPlayer = AVPlayer()
    var isPlaying: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        
        if CheckConnection.Connection() {
            setUpProperties()
            loadSongImage()
            getSongName()
            urlString()
        }
        else{
            activityIndicator.stopAnimating()
            self.Alert(Message: "Your device is Not Connected with Internet!")
            
        }
        


        // Do any additional setup after loading the view.
    }
    
    func setUpProperties() {
         view.backgroundColor = CustomColors(withFrame: view.frame).getBackgroundColor()
    }
  
    @IBAction func onButtonBackPressed(_ sender: Any) {
        player.replaceCurrentItem(with: nil)
    navigationController?.popViewController(animated: true)
    }
    
    
   private func loadSongImage() {
     let urlkey = URL(string: "http://nannistar.com/cover/OnAir.jpg")
    var image: UIImage?
        if let url = urlkey {
            
            DispatchQueue.global(qos: .userInitiated).async {
                let imageData = NSData(contentsOf: url)
                
                DispatchQueue.main.async {
                    if imageData != nil {
                        image = UIImage(data: imageData! as Data)
                        self.songImage.image = image
                        
                    }else {
                        image = nil
                    }
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    
 private func getSongName() {
    let texturl = URL(string: "http://217.116.9.142:9117/currentsong?sid=1")
        if let url = texturl{
            
            DispatchQueue.global(qos: .userInitiated).async {
             
                DispatchQueue.main.async {
                        do{
                            let contents = try String(contentsOf: url)
                            
                            self.songName.text = contents
                            
                        }catch{
                            print(error)
                        }
                    }
                    }
                }
            }
    func urlString() {
        let audioUrl = "http://217.116.9.142:9117"
        let url = NSURL(string: audioUrl)
        playSong(url: url!)
        
    }

    private func playSong(url: NSURL){
       
        do{
            try! AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try! AVAudioSession.sharedInstance().setActive(true)
            player =  AVPlayer(url: url as URL)
            player.volume = 1.0

        }
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
        if (player.rate == 1.0 && isPlaying==true) {
            showToast(message: "Disconnected")
            pauseButton.setBackgroundImage(UIImage(named: "play.png"), for: .normal)
            player.pause()
            isPlaying = false
        }
        else if(isPlaying == false) {
            showToast(message: "Connected")
            pauseButton.setBackgroundImage(UIImage(named: "pause.png"), for: .normal)
            player.play()
            isPlaying = true
        }
      
    }
    

    @IBAction func volumeChanged(_ sender: Any) {
        player.volume = volumeControlSlider.value;
    }
    
    @IBAction func fastForward(_ sender: Any) {
        showToast(message: "No Song Available")
    }
    
    @IBAction func fastBackward(_ sender: Any) {
        showToast(message: "No Song Available")
    }
    
    @IBAction func `repeat`(_ sender: Any) {
        showToast(message: "Cannot Repeat")
    }
    

    @IBAction func shuffleSong(_ sender: Any) {
        showToast(message: "No Data Available")
    }
    
    func Alert(Message: String) {
        
        let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertController.Style.alert )
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

extension LiveRadioViewController{
    func showToast(message: String){
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.width/2-75, y: self.view.frame.height - 150, width: 180, height: 40))
        
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor.white
        toastLabel.textColor = UIColor.black
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        toastLabel.text = message
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 1.0, options: .curveEaseInOut,
                       animations: {
                        toastLabel.alpha = 0.0
        }) { (isCompleted) in
            toastLabel.removeFromSuperview()
        }
    }
}
    


