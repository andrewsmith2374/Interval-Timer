//
//  HapticPlayer.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.29.
//

import Foundation
import WatchKit

func playHaptic() {
	// Play a haptic pattern
	var hapticDevice = WKInterfaceDevice()
	
	hapticDevice.play(WKHapticType(rawValue: 5).unsafelyUnwrapped)
}
