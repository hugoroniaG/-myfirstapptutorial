//
//  YogaTimer.swift
//  Stretch+Paws
//
//  Created by Hugo César García on 3/24/22.
//

import Foundation

// What kind of data type should this be? A class or a struct?
// Where does the timer need to be shared?

class YogaTimer: ObservableObject {
    // Timer states
    @Published var timerActive = false
    @Published var timerPaused = false
    @Published var timerEnded = false
    @Published var timerDuration = 30
    var yogaTimer = Timer()
    // Timer functionality
    // Start the timer
    func startTimer() {
        // Timer becomes active
        timerActive = true
        yogaTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { Timer in
            // Remove a second from the timer duration & loop over
            self.timerDuration -= 1
            // If the timer gets to 0, stop the timer
            if self.timerDuration == 0 {
                self.stopTimer()
            }
        })
     
    }
    // Pause the timer
    func pauseTimer() {
        // Timer stops being active
        timerActive = false
        // Timer becomes paused
        timerPaused = true
        // Timer stops running
        yogaTimer.invalidate()
    }
    // End the timer
    func stopTimer() {
        // Play a sound
        // Timer has ended
        timerEnded = true
        // Timer stops being active
        timerActive = false
        // Timer stops running
        yogaTimer.invalidate()
        // Timer duration resets ready for the next tiem we run it
        timerDuration = 30
    }
    // Play a sound
    func playSound() {
        // Play audio file
    }
    // Countdown

}

