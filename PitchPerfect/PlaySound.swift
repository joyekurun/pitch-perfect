//
//  PlaySound.swift
//  PitchPerfect
//
//  Created by Amrit Joyekurun on 3/24/15.
//  Copyright (c) 2015 Amrit Joyekurun. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySound: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func clearAudio() {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    
    // snail button
    
    @IBAction func PlayAudio(sender: UIButton)
    {
        clearAudio()
        
        audioPlayer.stop()
        audioPlayer.rate = 1.0
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        
    }
    
    // rabit button
    @IBAction func fastPlayAudio(sender: UIButton)
    {
        clearAudio()
        
        audioPlayer.stop()
        audioPlayer.rate = 2.0
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
   // stop button
    @IBAction func stopAll(sender: AnyObject)
    {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    // chimpmunk button
    @IBAction func playChimpmunkAudio(sender: UIButton)
    {
        playAudioWithVariablePitchChimpmunk(1000)
    }
        func playAudioWithVariablePitchChimpmunk(pitch: Float){
            clearAudio()
            
            audioPlayer.stop()
            audioEngine.stop()
            audioEngine.reset()
            
            var audioPlayerNode = AVAudioPlayerNode()
            audioEngine.attachNode(audioPlayerNode)
            
            var changePitchEffect = AVAudioUnitTimePitch()
            changePitchEffect.pitch = pitch
            audioEngine.attachNode(changePitchEffect)
            
            audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
            audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
            
            audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
            audioEngine.startAndReturnError(nil)
            
            audioPlayerNode.play()
        }
    // darthvader button
    
    @IBAction func playDarthvaderAudio(sender: UIButton)
    {
        playAudioWithVariablePitchDarthvader(-1000)
    }
    
    func playAudioWithVariablePitchDarthvader(pitch: Float){
        clearAudio()
        
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
}




