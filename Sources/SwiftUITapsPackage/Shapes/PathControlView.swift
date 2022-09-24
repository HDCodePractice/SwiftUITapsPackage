//
//  SwiftUIView.swift
//
//
//  Created by 老房东 on 2022-09-24.
//

import SwiftUI

struct PathControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "Path",
                    url: "https://developer.apple.com/documentation/swiftui/path",
                    description: String(localized: "The outline of a 2D shape.")
                )
                CreateShapFromPathLineView()
            }
            .padding()
        }
    }
}

private struct CreateShapFromPathLineView: View {
    var code: String {
        """
        struct TriangleView: View {
            struct Triangle: Shape {
                func path(in rect: CGRect) -> Path {
                    var path = Path()
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
                    return path
                }
            }
            var body: some View {
                Triangle()
                    .fill(.indigo)
                    .frame(width: \(width.valueString),height: \(height.valueString)
            }
        }
        """
    }

    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            return path
        }
    }

    @State var width = DoubleOption(name: "width", value: 100, range: 10...200)
    @State var height = DoubleOption(name: "height", value: 100, range: 10...200)
    var body: some View {
        VStack {
            Text("Create a triangle shape")
                .font(.title2)
            CodePreviewView(code: code)
            ZStack {
                Triangle()
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

struct PathControlView_Previews: PreviewProvider {
    static var previews: some View {
        PathControlView()
    }
}
