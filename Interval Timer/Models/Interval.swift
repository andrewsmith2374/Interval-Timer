//
//  Interval.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-25.
//

import Foundation

public class Interval: Identifiable, ObservableObject {
	/*
	 One interval of an IntervalTimer
	 
	 >>> interval = Interval()
	 >>> interval.duration
	 60.0
	 >>> interval.isRunning
	 false
	 >>> interval.timeRemaining
	 60.0
	 >>> interval.start()
	 >>> interval.isRunning
	 true
	 >>> interval.timeRemaining < interval.duration
	 true
	 >>> interval.stop()
	 >>> interval.isRunning
	 false
	 
	 === Attributes ===
	 duration: The duration of this interval in seconds
	 id: Unique identifier
	 isRunning: Whether this index is counting down or not
	 timeRemaining: The amount of time remaining on this interval in seconds

	 === Private Attributes ===
	 _startTime: The datetime for the last time the timer ticked
	 _timer: The Timer object used by this interval
	 */
	let duration: Duration
	public var id = UUID()
	@Published var isRunning: Bool
	internal var _startTime: Date
	var _timer: Timer
	@Published var timeRemaining: Duration
		
	init(duration: Double = 60.0) {
		if duration < 0 {
			self.duration = .seconds(0)
		} else {
			self.duration = .seconds(duration)
		}
		self.isRunning = false
		self._startTime = Date()
		self._timer = Timer()
		self.timeRemaining = self.duration
	}
	
	func start() {
		// Start this interval
		if self.isRunning || self.timeRemaining <= .seconds(0) {
			return
		}
		self.isRunning = true
		self._startTime = Date()
		self._timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self._timerTick), userInfo: nil, repeats: true)
	}
	
	func stop() {
		// Stop this interval
		if !self.isRunning {
			return
		}
		self._timer.invalidate()
		self.isRunning = false
	}
	
	@objc internal func _timerTick() {
		// Update timeRemaining and check if this interval has ended
		var timeDifference: Duration
		timeDifference = .milliseconds(Date().timeIntervalSince(self._startTime) * 1000)
		self.timeRemaining = max(self.timeRemaining - timeDifference, .zero)
		self._startTime = Date()
		if self.timeRemaining <= .zero {
			// self.timeRemaining = .zero
			self.stop()
		}
	}
}
