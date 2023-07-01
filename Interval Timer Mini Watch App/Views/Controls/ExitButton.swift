//
//  ExitButton.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023.07.01.
//

import SwiftUI

struct ExitButton: View {
	@Environment(\.presentationMode) var presentationMode

	var body: some View {
		Button(action: {
			presentationMode.wrappedValue.dismiss()
		}) {
			Image(systemName: "xmark")
				.fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
		}
		.frame(width: 30, height: 30)
		.foregroundColor(Color.white)
		.background(Color.red)
		.clipShape(Circle())
		.navigationBarBackButtonHidden(true)
	}
}

struct ExitButton_Previews: PreviewProvider {
    static var previews: some View {
        ExitButton()
    }
}
