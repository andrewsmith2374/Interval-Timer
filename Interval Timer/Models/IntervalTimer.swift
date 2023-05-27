//
//  IntervalTimer.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-24.
//

import Foundation

public struct IntervalTimer: CustomStringConvertible, Identifiable {
	/*
	 Timer that continues to predetermined intervals
	 
	 >>> var intervalTimer = IntervalTimer()
	 >>> print(intervalTimer)
	 "Interval Timer with 1 Interval"
	 >>> intervalTimer.autoContinue
	 false
	 >>> intervalTimer.intervals
	 [Interval]
	 >>> intervalTimer.status
	 0
	 >>> intervalTimer.title
	 "Timer"
	 >>> intervalTimer.autoContinue = true
	 >>> intervalTimer.intervals = [Interval(), Interval()]
	 >>> intervalTimer.title = "Title"
	 >>> intervalTimer.start()
	 >>> intervalTimer.status
	 1
	 >>> intervalTimer.currentInterval
	 0
	 >>> intervalTimer.getCurrentIntervalDuration()
	 60.0
	 >>> intervalTimer.getCurrentIntervalTimeRemaining()
	 59.0
	 >>> intervalTimer.nextInterval()
	 >>> intervalTimer.currentInterval
	 1
	 >>> intervalTimer.isLastInterval()
	 true
	 >>> intervalTimer.pause()
	 >>> intervalTimer.status
	 2
	 >>> intervalTimer.reset()
	 >>> intervalTimer.status
	 0
	 
	 === Attributes ===
	 autoContinue: Whether the timer will automatically continue to the next interval after each interval elapses
	 currentInterval: The index of the current running interval
	 id: Unique identifier
	 intervals: A list of each interval contained in this timer
	 status: 0 if this timer has not been started, 1 if in progress, 2 if paused, 3 if finished
	 title: The title of this timer
	 */
	var autoContinue: Bool
	var currentInterval: Int
	public var description: String {
		var suffix: String
		if self.getNumIntervals() == 1 {
			suffix = ""
		} else {
			suffix = "s"
		}
		return "Interval Timer with \(self.getNumIntervals()) Interval\(suffix)"
	}
	public let id = UUID()
	var intervals: [_Interval]
	var status: Int
	var title: String
	
	init(autoContinue: Bool = false, intervals: [_Interval] = [], title: String = "Timer") {
		// Creates a new IntervalTimer with given <autoContinue>, default true; <intervals>, default empty; and <title>, default 'Timer'
		self.autoContinue = autoContinue
		self.currentInterval = 0
		self.intervals = intervals
		self.status = 0
		self.title = title

		self._initializeIntervals()
	}
	
	mutating func endTimer() {
		// End this timer if currently running
		if self.status == 3 {
			return
		}
		self.status = 3
		for interval in self.intervals {
			interval.stop()
			interval.timeRemaining = 0.0
		}
		self.currentInterval = self.getNumIntervals() - 1
	}
	
	private mutating func _initializeIntervals() {
		// Assign indexes to each interval
		var i: Int = 0
		for _ in self.intervals {
			intervals[i].index = i
			i += 1
		}
	}
	
	mutating func nextInterval() {
		// Move this timer to the next interval, preserving play/pause state and iterating self.currentInterval
		if self.status == 3 {
			return
		}
		// TODO: Change to use internal method when self.isLastMethod() is implemented
		let isLastInterval = self.currentInterval == self.getNumIntervals() - 1
		if isLastInterval {
			self.endTimer()
		}
		
		self.intervals[self.currentInterval].stop()
		self.intervals[self.currentInterval].timeRemaining = 0.0
		self.currentInterval += 1
		
		if self.status == 1 {
			self.intervals[currentInterval].start()
		}
	}
	
	mutating func pause() {
		// Pause this timer if running, changing self.status to 2
		let validToPause: Bool = self.status == 1
		if !validToPause {
			return
		}
		self.status = 2
		self.intervals[self.currentInterval].stop()
	}
	
	mutating func reset() {
		// Reset this timer, changing self.status and self.currentInterval to 0
		if self.status == 0 {
			return
		}
		self.status = 0
		for interval in self.intervals {
			interval.stop()
			interval.timeRemaining = interval.duration
		}
		self.currentInterval = 0
	}
	
	mutating func start() {
		// Start this timer if not currently running, changing self.status to 1
		let validToStart: Bool = self.status % 2 == 0 && self.getNumIntervals() > 0
		if !validToStart {
			return
		}
		self.status = 1
		self.intervals[self.currentInterval].start()
	}
	
	// TODO: Implement
	func getCurrentIntervalDuration() -> TimeInterval {
		// Return the current interval's duration in seconds
		return 0.0
	}
	
	// TODO: Implement
	func getCurrentIntervalTimeRemaining() -> TimeInterval {
		// Return the amount of time remaining on the current interval in seconds
		return 0.0
	}
	
	// TODO: Implement
	func isLastInterval() -> Bool {
		// Return whether the current interval is the last one in this timer
		return false
	}
	
	func getNumIntervals() -> Int {
		// Return the number of intervals in this timer
		return self.intervals.count
	}
}
