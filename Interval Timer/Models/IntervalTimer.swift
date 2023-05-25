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
	 >>> intervalTimer.getCurrentIntervalTimeLeft()
	 59.0
	 >>> intervalTimer.nextInterval()
	 >>> intervalTimer.currentInterval
	 1
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
		let numIntervals: Int = intervals.count
		if numIntervals == 1 {
			suffix = ""
		} else {
			suffix = "s"
		}
		return "Interval Timer with \(numIntervals) Interval\(suffix)"
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
	
	private mutating func _initializeIntervals() {
		// Assigns indexes to each interval
		var i: Int = 0
		for _ in self.intervals {
			intervals[i].index = i
			i += 1
		}
	}
	
	mutating func start() {
		// Starts this timer if not currently running, changing self.status to 1
		if self.status != 0 {
			return
		}
	}
	
	mutating func pause() {
		// Pauses this timer if running, changing self.status to 2
	}
	
	mutating func reset() {
		// Resets this timer, changing self.status and self.currentInterval to 0
	}
	
	mutating func nextInterval() {
		// Moves this timer to the next interval, preserving play/pause state and iterating self.currentInterval
	}
	
	func getCurrentIntervalDuration() -> TimeInterval {
		// Returns the current interval's duration in seconds
		return 0.0
	}
	
	func getCurrentIntervalTimeLeft() -> TimeInterval {
		// Returns the amount of time remaining on the current interval in seconds
		return 0.0
	}
}
