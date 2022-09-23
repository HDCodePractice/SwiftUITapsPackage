//
//  RectangularShapesControlView.swift
//
//
//  Created by 老房东 on 2022-09-22.
//

import SwiftUI

struct RectangularShapesControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "Rectangle",
                    url: "https://developer.apple.com/documentation/swiftui/rectangle",
                    description: String(localized: "A rectangular shape aligned inside the frame of the view containing it.")
                )

                RectangleSampleView()
                Divider()
                HeadlineView(
                    title: "RoundedRectangle",
                    url: "https://developer.apple.com/documentation/swiftui/roundedrectangle",
                    description: String(localized: "A rectangular shape with rounded corners, aligned inside the frame of the view containing it.")
                )
                RoundedRectangleSampleView()
            }
            .padding()
        }
    }
}

private struct RoundedRectangleSampleView: View {
    var code: String {
        return """
        RoundedRectangle(cornerRadius: \(cornerRadius.valueString), style: .circular)
            .fill(.cyan)
            .frame(width: 130,height: 100)
        RoundedRectangle(cornerRadius: \(cornerRadius.valueString), style: .continuous)
            .fill(.cyan)
            .frame(width: 130,height: 100)
        RoundedRectangle(
            cornerSize: CGSize(width: \(width.valueString), height: \(height.valueString),
            style: .circular)
            .fill(.gray)
            .frame(width: 130, height: 100)
        RoundedRectangle(
            cornerSize: CGSize(width: \(width.valueString), height: \(height.valueString),
            style: .continuous)
            .fill(.gray)
            .frame(width: 130, height: 100)
        """
    }

    @State var cornerRadius = DoubleOption(name: "cornerRadius", value: 20, range: 0...60)
    @State var width = DoubleOption(name: "width", value: 20, range: 0...60)
    @State var height = DoubleOption(name: "height", value: 20, range: 0...60)

    var body: some View {
        VStack {
            Text("Create a RoundedRectangle")
                .font(.title2)
            CodePreviewView(code: code)
            RoundedRectangle(cornerRadius: cornerRadius.value, style: .circular)
                .fill(.cyan)
                .frame(width: 130, height: 100)
            RoundedRectangle(cornerRadius: cornerRadius.value, style: .continuous)
                .fill(.cyan)
                .frame(width: 130, height: 100)
            DoubleOptionView(option: $cornerRadius)
            RoundedRectangle(
                cornerSize: CGSize(width: width.value, height: height.value),
                style: .circular
            )
            .fill(.gray)
            .frame(width: 130, height: 100)
            RoundedRectangle(
                cornerSize: CGSize(width: width.value, height: height.value),
                style: .continuous
            )
            .fill(.gray)
            .frame(width: 130, height: 100)
            DoubleOptionView(option: $width)
            DoubleOptionView(option: $height)
        }
    }
}

private struct RectangleSampleView: View {
    var code = """
    Rectangle()
        .fill(.mint)
        .frame(width: 200,height: 100)
    """
    var body: some View {
        Text("Create a Rectangle")
            .font(.title2)
        CodePreviewView(code: code)
        Rectangle()
            .fill(.mint)
            .frame(width: 200, height: 100)
    }
}

struct RectangularShapesControlView_Previews: PreviewProvider {
    static var previews: some View {
        RectangularShapesControlView()
    }
}
