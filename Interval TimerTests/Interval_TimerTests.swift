//
//  Interval_TimerTests.swift
//  Interval TimerTests
//
//  Created by Andrew Smith on 2023-05-24.
//

import XCTest

final class Interval_TimerTests: XCTestCase {
	
	func testIntervalTimerInitTitleDefault() {
		// Test that IntervalTimer initializes proper default title values
		let intervalTimer = IntervalTimer()
		
		XCTAssertEqual(intervalTimer.getTitle(), "Timer")
	}
	
	func testIntervalTimerInitTitleDefined() {
		// Test that IntervalTimer initializes proper defined title values
		let title = "Test"
		let intervalTimer = IntervalTimer(title: title)
		
		XCTAssertEqual(intervalTimer.getTitle(), title)
	}

}
