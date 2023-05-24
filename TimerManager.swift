//
//  TimerManager.swift
//  CountdownTimer
//
//  Created by Dhanush Arun on 7/28/21.
//

import SwiftUI
import AVFoundation
import Foundation

var player: AVAudioPlayer!

class TimerManager: ObservableObject {
    @Published var timerMode:TimerMode = .initial
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLenght")
    var timer = Timer()
    
    func setTimerLenght(minutes: Int){
        let defaults = UserDefaults.standard
        defaults.setValue(minutes, forKey: "timerLenght")
        secondsLeft = minutes
        
    }
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0{
                self.reset()
                
            }
            self.secondsLeft -= 1
        })
        
    }
    
    func reset(){
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLenght")
        self.timerMode = .initial
        timer.invalidate()
        
    }
    
    func pause(){
        self.timerMode = .paused
        timer.invalidate()
        
    }
    
}
