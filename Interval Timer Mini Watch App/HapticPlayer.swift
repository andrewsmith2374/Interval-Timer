//
//  HapticPlayer.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.29.
//

import Foundation
import WatchKit

class HapticPlayer {
	var timer: Timer
	
	init() {
		self.timer = Timer()
	}
	
	func startTimer() {
		// While the timer is ended, play a repeating haptic
		self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(playHaptic), userInfo: nil, repeats: true)
	}

	func endTimer() {
		self.timer.invalidate()
	}

	@objc func playHaptic() {
		// Play a haptic pattern
		let hapticDevice = WKInterfaceDevice()
		
		hapticDevice.play(WKHapticType(rawValue: 5).unsafelyUnwrapped)
	}
}
