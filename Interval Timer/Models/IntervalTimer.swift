//
//  IntervalTimer.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-24.
//

import Foundation

public struct IntervalTimer: Identifiable {
	/*
	 Timer that continues to predetermined intervals
	 
	 >>> var intervalTimer = IntervalTimer()
	 >>> print(intervalTimer)
	 "Interval Timer with 1 Interval"
	 >>> intervalTimer.autoContinue
	 false
	 >>> intervalTimer.intervals
	 []
	 >>> intervalTimer.title
	 "Timer"
	 >>> intervalTimer.autoContinue = true
	 >>> intervalTimer.intervals = [60.0, 50.0]
	 >>> intervalTimer.title = "Title"
	 
	 === Attributes ===
	 autoContinue: Whether the timer will automatically continue to the next interval after each interval elapses
	 id: Unique identifier
	 intervals: A list of the duration of each interval contained in this timer
	 title: The title of this timer
	 */
	var autoContinue: Bool
	public let id = UUID()
	var intervals: [Double]
	var title: String
	
	init(autoContinue: Bool = true, intervals: [Double] = [], title: String = "Timer") {
		// Creates a new IntervalTimer with given <autoContinue>, default true; <intervals>, default empty; and <title>, default 'Timer'
		self.autoContinue = autoContinue
		self.intervals = intervals
		self.title = title
	}
	
	func getNumIntervals() -> Int {
		// Return the number of intervals in this timer
		return self.intervals.count
	}
}
