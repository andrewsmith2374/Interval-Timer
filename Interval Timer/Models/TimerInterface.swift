//
//  TimerInterface.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-27.
//

import Foundation

public class TimerInterface: Identifiable, ObservableObject {
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
	@Published var timer: IntervalTimer
	@Published var finished: Bool
	
	init(timer: IntervalTimer) {
		self.timer = timer
		self.finished = timer.intervals[timer.getNumIntervals() - 1].timeRemaining == .seconds(0) // && timer.getCurrentInterval().timeRemaining == .seconds(0)
	}
	
	func nextInterval() {
		// Move this timer to the next interval
		self.timer.nextInterval()
	}

	func resetTimer() {
		// Reset this interface's timer
		self.timer.reset()
	}
}
