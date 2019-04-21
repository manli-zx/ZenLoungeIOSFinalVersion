//
//  ViewController.swift
//  Zen Lounge
//
//  Created by admin on 2019-04-14.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    
        
        
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       loadSound()
    }
    //Funtion for music 
    func loadSound(){
        if let soundUrl = Bundle.main.url(forResource: "chill",withExtension: "wav"){
            do{audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
                audioPlayer.numberOfLoops = 1000
                audioPlayer.play()
                
            }catch{
                print(error)
            }
        }
    }
}

