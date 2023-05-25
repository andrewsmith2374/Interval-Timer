//
//  IntervalTimer.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-24.
//

import Foundation

public struct IntervalTimer {
	/*
	 Timer that continues to predetermined intervals
	 
	 >>> var intervalTimer = IntervalTimer()
	 >>> print(intervalTimer)
	 "Interval Timer with 1 Interval of 60 seconds"
	 >>> intervalTimer.getTitle()
	 "Timer"
	 >>> intervalTimer.getIntervals()
	 [Interval]
	 >>> intervalTimer.getAutoContinue()
	 False
	 >>> intervalTimer.getID() is UUID
	 True
	 >>> intervalTimer.setTitle(title: "Test")
	 >>> intervalTimer.addInterval()
	 >>> intervalTimer.setIntervals([Interval(), Interval()]
	 >>> intervalTimer.toggleAutoContinue()
	 >>> intervalTimer.setAutoContinue(True)
	 
	 === Attributes ===
	 autoContinue: Whether the timer will automatically continue to the next interval after each interval elapses
	 id: Unique identifier
	 intervals: A list of each interval contained in this timer
	 title: The title of this timer
	 */
	var autoContinue: Bool
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
	
	func getID() -> UUID {
		// Returns self.id
		return self.id
	}
	
	func getTitle() -> String {
		// Returns self.title
		return self.title
	}
}
