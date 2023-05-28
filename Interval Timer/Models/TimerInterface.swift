//
//  TimerInterface.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-27.
//

import Foundation

public class TimerInterface: Identifiable {
	/*
	 An interface between a Swift view and an IntervalTimer object
	 
	 interface = TimerInterface(timer: IntervalTimer())
	 interface.timer.getCurrentInterval().isRunning
	 true
	 interface.resetTimer()
	 interface.timer.getCurrentInterval.isRunning
	 false

	 === Public Attributes ===
	 id: Unique identifier
	 timer: The timer this interface provides access to
	 */
	public let id = UUID()
	var timer: IntervalTimer
	
	init(timer: IntervalTimer) {
		self.timer = timer
	}
	
	func resetTimer() {
		// Reset this interface's timer
		self.timer.reset()
	}
}
