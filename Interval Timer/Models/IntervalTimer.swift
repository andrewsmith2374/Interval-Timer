//
//  IntervalTimer.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-24.
//

import Foundation

public struct IntervalTimer: CustomStringConvertible {
	/*
	 Timer that continues to predetermined intervals
	 
	 >>> var intervalTimer = IntervalTimer()
	 >>> print(intervalTimer)
	 "Interval Timer with 1 Interval"
	 >>> intervalTimer.getAutoContinue()
	 False
	 >>> intervalTimer.getIntervals()
	 [Interval]
	 >>> intervalTimer.getTitle()
	 "Timer"
	 >>> intervalTimer.toggleAutoContinue()
	 >>> intervalTimer.setAutoContinue(True)
	 >>> intervalTimer.addInterval()
	 >>> intervalTimer.setIntervals([Interval(), Interval()]
	 >>> intervalTimer.setTitle(title: "Test")
	 
	 === Attributes ===
	 autoContinue: Whether the timer will automatically continue to the next interval after each interval elapses
	 id: Unique identifier
	 intervals: A list of each interval contained in this timer
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
	let id = UUID()
	// Change to [Interval] once Interval has been implemented
	var intervals: Array<Any>
	var title: String
	
	init(autoContinue: Bool = true, intervals: Array<Any> = [], title: String = "Timer") {
		// Creates a new IntervalTimer with given <title>, default 'Timer'
		self.autoContinue = autoContinue
		self.intervals = intervals
		self.title = title
	}
	
	mutating func setTitle(title: String) {
		// Changes self.title to <title>
		self.title = title
	}
		
	func getTitle() -> String {
		// Returns self.title
		return self.title
	}
}
