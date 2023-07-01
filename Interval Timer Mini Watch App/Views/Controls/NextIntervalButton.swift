//
//  NextIntervalButton.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-06-07.
//

import SwiftUI

struct NextIntervalButton: View {
	@Binding var currentInterval: Int

    var body: some View {
		Button(action: { currentInterval += 1 }) {
			Image(systemName: "forward.frame.fill")
		}
		.frame(width: 30, height: 30)
		.foregroundColor(Color.white)
		.background(Color.black)
		.clipShape(Circle())
    }
}

struct NextIntervalButton_Previews: PreviewProvider {
    static var previews: some View {
		@State var currentInterval: Int = 0
		
		NextIntervalButton(currentInterval: $currentInterval)
    }
}
