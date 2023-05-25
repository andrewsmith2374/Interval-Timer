//
//  Interval_TimerTests.swift
//  Interval TimerTests
//
//  Created by Andrew Smith on 2023-05-24.
//

import XCTest

final class Interval_TimerTests: XCTestCase {
	
	func testIntervalInitDefault() {
		// Test that Interval initializes proper default values
		let interval = Interval()
		
		XCTAssertEqual(String(describing: interval), "Interval of duration 60.0 seconds")
		XCTAssertEqual(interval.duration, 60.0)
		XCTAssertEqual(interval.index, 0)
	}
	
	func testIntervalDescriptionOneSecond() {
		// Test that Interval has proper String representation when duration is one second
		let interval = Interval(duration: 1.0)
		
		XCTAssertEqual(String(describing: interval), "Interval of duration 1.0 second")
	}
		
	func testIntervalInitDuration() {
		// Test that Interval properly initializes duration
		let interval = Interval(duration: 2.0)
		
		XCTAssertEqual(interval.duration, 2.0)
	}
	
	func testIntervalInitDurationNegative() {
		// Test that Interval properly handles negative duration inputs
		let interval = Interval(duration: -20.0)
		
		XCTAssertEqual(interval.duration, 0.0)
	}
	
	func testIntervalInitDurationInt() {
		// Test that Interal properly handles int inputs
		let interval = Interval(duration: 60)
		
		XCTAssertEqual(interval.duration, 60.0)
	}
	
	func testIntervalInitIndex() {
		// Test that Interval properly intializes index
		let interval = Interval(index: 1)
		
		XCTAssertEqual(interval.index, 1)
	}
	
	func testIntervalInitIndexNegative() {
		// Test that Interval properly handles negative index inputs
		let interval = Interval(index: -1)
		
		XCTAssertEqual(interval.index, 0)
	}
	
	func testIntervalTimerInitDefault() {
		// Test that IntervalTimer initializes proper default values
		let intervalTimer = IntervalTimer()
		
		XCTAssertEqual(intervalTimer.autoContinue, false)
		XCTAssertEqual(String(describing: intervalTimer), "Interval Timer with 0 Intervals")
		XCTAssert(intervalTimer.intervals.isEmpty)
		XCTAssertEqual(intervalTimer.title, "Timer")
	}
	
	func testIntervalTimerInitAutoContinue() {
		// Test that IntervalTimer properly initializes autoContinue
		let intervalTimer = IntervalTimer(autoContinue: true)
		
		XCTAssert(intervalTimer.autoContinue)
	}
	
	func testIntervalTimerDescriptionOneInterval() {
		// Test that IntervalTimer has proper String representation when it has one interval
		let intervalTimer = IntervalTimer(intervals: [Interval()])
		
		XCTAssertEqual(String(describing: intervalTimer), "Interval Timer with 1 Interval")
	}
	
	func testIntervalTimerDescriptionMultipleIntervals() {
		// Test that IntervalTimer has proper String representation when empty
		let intervalTimer = IntervalTimer(intervals: [Interval(), Interval()])
		
		XCTAssertEqual(String(describing: intervalTimer), "Interval Timer with 2 Intervals")
	}
	
	func testIntervalTimerInitIntervalsOneInterval() {
		// Test that IntervalTimer correctly initializes with one interval
		let intervalTimer = IntervalTimer(intervals: [Interval()])
		
		XCTAssertEqual(intervalTimer.intervals.count, 1)
		XCTAssertEqual(intervalTimer.intervals[0].index, 0)
	}
	
	func testIntervalTimerInitIntervalsMultipleIntervals() {
		// Test that IntervalTimer correctly initializes with proper indexing
		let intervalList = [Interval(), Interval(), Interval(), Interval()]
		let intervalTimer = IntervalTimer(intervals: intervalList)
		var i: Int = 0
		
		for interval in intervalTimer.intervals {
			XCTAssertEqual(interval.index, i)
			i += 1
		}
	}
	
	func testIntervalTimerInitTitleDefined() {
		// Test that IntervalTimer initializes proper defined title values
		let title = "Test"
		let intervalTimer = IntervalTimer(title: title)
		
		XCTAssertEqual(intervalTimer.title, title)
	}
		
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func testExample() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		// Any test you write for XCTest can be annotated as throws and async.
		// Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
		// Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
	}

	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		measure {
			// Put the code you want to measure the time of here.
		}
	}

}
