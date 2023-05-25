//
//  IntervalTimer.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-24.
//

import Foundation

public struct IntervalTimer {
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
