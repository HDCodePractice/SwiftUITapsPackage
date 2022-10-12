//
//  DragGestureControlView.swift
//
//
//  Created by 老房东 on 2022-10-12.
//

import SwiftUI

struct DragGestureControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "DragGesture",
                    url: "https://developer.apple.com/documentation/swiftui/draggesture",
                    description: String(localized: "A dragging motion that invokes an action as the drag-event sequence changes.")
                )
                DragGestureSampleView()
            }
            .padding()
        }
    }
}

struct DragGestureSampleView: View {
    var code = """
    struct DragGestureSampleView: View {
        @State var isDragging = false
        @State var location: CGPoint = .init(x: 0, y: 0)

        var drag: some Gesture {
            DragGesture()
                .onChanged { value in
                    self.isDragging = true
                    location = value.location
                }
                .onEnded { _ in self.isDragging = false }
        }

        var body: some View {
            VStack {
                ZStack {
                    Circle()
                        .fill(isDragging ? .red : .blue)
                        .frame(width: 50, height: 50, alignment: .center)
                        .offset(x: location.x-25, y: location.y-25)
                        .gesture(drag)
                    Text("x:\\(location.x, specifier: "%.2f") y:\\(location.y, specifier: "%.2f")")
                }
                .frame(width: 300, height: 300)
                .border(.primary)
            }
        }
    }
    """
    @State var isDragging = false
    @State var location: CGPoint = .init(x: 0, y: 0)

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.isDragging = true
                location = value.location
            }
            .onEnded { _ in self.isDragging = false }
    }

    var body: some View {
        VStack {
            Text("Create a DragGesture")
                .font(.title2)
            CodePreviewView(code: code)
            ZStack {
                Circle()
                    .fill(isDragging ? .red : .blue)
                    .frame(width: 50, height: 50, alignment: .center)
                    .offset(x: location.x-25, y: location.y-25)
                    .gesture(drag)
                Text("x:\(location.x, specifier: "%.2f") y:\(location.y, specifier: "%.2f")")
            }
            .frame(width: 300, height: 300)
            .border(.primary)
        }
    }
}

struct DragGestureControlView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureControlView()
    }
}
