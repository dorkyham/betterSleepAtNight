//
//  Alarm.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 18/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import Foundation
import AVFoundation

class Alarm {
    var audioPlayer = AVAudioPlayer()
    let ringSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ring", ofType: "wav")!)
    let lullabySound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ring", ofType: "wav")!)
    
    func ring(){
        audioPlayer = try! AVAudioPlayer(contentsOf: ringSound as URL)
        audioPlayer.prepareToPlay()
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
    }
    
    func lullaby(){
        audioPlayer = try! AVAudioPlayer(contentsOf: lullabySound as URL)
        audioPlayer.prepareToPlay()
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
    }
}
