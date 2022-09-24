//
//  CircularShapesControlView.swift
//
//
//  Created by 老房东 on 2022-09-23.
//

import SwiftUI

struct CircularShapesControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "Circle",
                    url: "https://developer.apple.com/documentation/swiftui/circle",
                    description: String(localized: "A circle centered on the frame of the view containing it.")
                )
                CircleSampleView()
                Divider()
                HeadlineView(
                    title: "Ellipse",
                    url: "https://developer.apple.com/documentation/swiftui/ellipse",
                    description: String(localized: "An ellipse aligned inside the frame of the view containing it.")
                )
                EllipseSampleView()
                Divider()
                HeadlineView(
                    title: "Capsule",
                    url: "https://developer.apple.com/documentation/swiftui/capsule",
                    description: String(localized: "A capsule shape aligned inside the frame of the view containing it.")
                )
                CapsuleSampleView()
            }
            .padding()
        }
    }
}

private struct CapsuleSampleView: View {
    var code: String {
        """
        Capsule()
            .fill(.indigo)
            .frame(width: \(width.valueString),height: \(height.valueString)
        """
    }

    @State var width = DoubleOption(name: "width", value: 100, range: 10...200)
    @State var height = DoubleOption(name: "height", value: 100, range: 10...200)
    var body: some View {
        VStack {
            Text("Create a Capsule")
                .font(.title2)
            CodePreviewView(code: code)
            ZStack {
                Capsule()
                    .fill(.indigo)
                    .frame(width: width.value, height: height.value)
            }
            .frame(width: 200, height: 200)
            .border(.primary)
            DoubleOptionView(option: $width)
            DoubleOptionView(option: $height)
        }
    }
}

private struct EllipseSampleView: View {
    var code: String {
        """
        Ellipse()
            .fill(.indigo)
            .frame(width: \(width.valueString),height: \(height.valueString)
        """
    }

    @State var width = DoubleOption(name: "width", value: 100, range: 10...200)
    @State var height = DoubleOption(name: "height", value: 100, range: 10...200)
    var body: some View {
        VStack {
            Text("Create a Ellipse")
                .font(.title2)
            CodePreviewView(code: code)
            ZStack {
                Ellipse()
                    .fill(.indigo)
                    .frame(width: width.value, height: height.value)
            }
            .frame(width: 200, height: 200)
            .border(.primary)
            DoubleOptionView(option: $width)
            DoubleOptionView(option: $height)
        }
    }
}

private struct CircleSampleView: View {
    var code: String {
        """
        Circle()
            .fill(.indigo)
            .frame(width: \(width.valueString),height: \(height.valueString)
        """
    }

    @State var width = DoubleOption(name: "width", value: 100, range: 10...200)
    @State var height = DoubleOption(name: "height", value: 100, range: 10...200)
    var body: some View {
        VStack {
            Text("Create a Circle")
                .font(.title2)
            CodePreviewView(code: code)
            ZStack {
                Circle()
                    .fill(.indigo)
                    .frame(width: width.value, height: height.value)
            }
            .frame(width: 200, height: 200)
            .border(.primary)
            DoubleOptionView(option: $width)
            DoubleOptionView(option: $height)
        }
    }
}

struct CircularShapesControlView_Previews: PreviewProvider {
    static var previews: some View {
        CircularShapesControlView()
    }
}
