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
	 >>> intervalTimer.title
	 "Timer"
	 >>> intervalTimer.autoContinue = true
	 >>> intervalTimer.intervals = [Interval(), Interval()]
	 >>> intervalTimer.title = "Title"
	 >>> interval = intervalTimer.getCurrentInterval()
	 >>> intervalTimer.getCurrentInterval().index
	 0
	 >>> intervalTimer.nextInterval()
	 >>> intervalTimer.getCurrentInterval().index
	 1
	 >>> intervalTimer.isLastInterval()
	 true
	 >>> intervalTimer.reset()
	 >>> intervalTimer.getCurrentInterval().index
	 0
	 
	 === Attributes ===
	 autoContinue: Whether the timer will automatically continue to the next interval after each interval elapses
	 id: Unique identifier
	 intervals: A list of each interval contained in this timer
	 title: The title of this timer

	=== Private Attributes ===
	 _currentInterval: The index of the current running interval
	 */
	var autoContinue: Bool
	internal var _currentInterval: Int
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
	var intervals: [Interval]
	var title: String
	
	init(autoContinue: Bool = false, intervals: [Interval] = [], title: String = "Timer") {
		// Creates a new IntervalTimer with given <autoContinue>, default true; <intervals>, default empty; and <title>, default 'Timer'
		self.autoContinue = autoContinue
		self._currentInterval = 0
		self.intervals = intervals
		self.title = title

		self._initializeIntervals()
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
		// TODO: Change to use internal method when self.isLastMethod() is implemented
		let isLastInterval = self._currentInterval == self.getNumIntervals() - 1
		if isLastInterval {
			self.reset()
		}
		
		self.intervals[self._currentInterval].stop()
		self.intervals[self._currentInterval].timeRemaining = 0.0
		self._currentInterval += 1
	}
	
	mutating func reset() {
		// Reset this timer, changing self.status and self.currentInterval to 0
		for interval in self.intervals {
			interval.stop()
			interval.timeRemaining = interval.duration
		}
		self._currentInterval = 0
	}
	
	// TODO: Implement
	func getCurrentInterval() -> Interval {
		// Return the current interval
		return Interval()
	}
	
	func getNumIntervals() -> Int {
		// Return the number of intervals in this timer
		return self.intervals.count
	}

	// TODO: Implement
	func isLastInterval() -> Bool {
		// Return whether the current interval is the last one in this timer
		return false
	}
}
