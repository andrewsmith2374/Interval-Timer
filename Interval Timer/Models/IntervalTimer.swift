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
	 */
	
	var title: String
	
	init(title: String = "Timer") {
		// Creates a new IntervalTimer with given <title>, default 'Timer'
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
