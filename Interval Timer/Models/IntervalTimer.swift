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
	 >>> intervalTimer.pause()
	 >>> intervalTimer.status
	 2
	 >>> intervalTimer.cancel()
	 >>> intervalTimer.status
	 3
	 
	 === Attributes ===
	 autoContinue: Whether the timer will automatically continue to the next interval after each interval elapses
	 id: Unique identifier
	 intervals: A list of each interval contained in this timer
	 status: 0 if this timer has not been started, 1 if in progress, 2 if paused, 3 if finished
	 title: The title of this timer
	 */
	var autoContinue: Bool
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
	var intervals: [Interval]
	var title: String
	
	init(autoContinue: Bool = false, intervals: [Interval] = [], title: String = "Timer") {
		// Creates a new IntervalTimer with given <autoContinue>, default true; <intervals>, default empty; and <title>, default 'Timer'
		self.autoContinue = autoContinue
		self.intervals = intervals
		self.title = title

		self.initializeIntervals()
	}
	
	private mutating func initializeIntervals() {
		var i: Int = 0
		for _ in self.intervals {
			intervals[i].index = i
			i += 1
		}
	}
}
