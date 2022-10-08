//
//  SwiftUIView.swift
//
//
//  Created by 老房东 on 2022-10-07.
//

import SwiftUI

struct SliderControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "Slider",
                    url: "https://developer.apple.com/documentation/swiftui/slider",
                    description: String(localized: "A control for selecting a value from a bounded linear range of values.")
                )
                CreateSliderSample()
            }
            .padding()
        }
    }
}

private struct CreateSliderSample: View {
    var code: String {
        """
        @State var speed = 50.0
        var body: some View {
            VStack {
                Slider(value: $speed, in: 0 ... 360)
                Slider(value: $speed, in: 0 ... 360, step: 1)
                Slider(value: $speed, in: 0 ... 360) {
                    Text("Speed:")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("360")
                }
            }
        }
        """
    }

    @State var degrees = 50.0
    var body: some View {
        VStack {
            Text("Create a Slider")
                .font(.title2)
            CodePreviewView(code: code)
            Image("OneTapSwiftUI",bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
                .padding()
                .rotationEffect(.degrees(degrees))
            Text("\(degrees, specifier: "%.2f")")
            Slider(value: $degrees, in: 0 ... 360)
            Slider(value: $degrees, in: 0 ... 360, step: 1)
            Slider(value: $degrees, in: 0 ... 360) {
                Text("Speed:")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("360")
            }
        }
    }
}

struct SliderControlView_Previews: PreviewProvider {
    static var previews: some View {
        SliderControlView()
    }
}
