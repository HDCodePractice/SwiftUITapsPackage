//
//  SwiftUIView.swift
//
//
//  Created by 老房东 on 2022-09-29.
//

import SwiftUI

struct CanvasControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "Canvas",
                    url: "https://developer.apple.com/documentation/swiftui/canvas",
                    description: String(localized: "A view type that supports immediate mode drawing.")
                )
                CreateCanvasSampleView()
                Divider()
                CreateCanvasHaveSymbols()
            }
            .padding()
        }
    }
}

struct CreateCanvasHaveSymbols: View {
    var code = """
        struct CreateCanvasHaveSymbols: View {
            @State var isChangeImage = false
            @State var isChangeID = false
            var body: some View {
                VStack {
                    VStack {
                        Canvas { context, size in
                            if let mark = context.resolveSymbol(id: isChangeID ? 1 : 2) {
                                context.draw(mark, at: CGPoint(x: size.width/2, y: size.height/2))
                            }
                        } symbols: {
                            Image(systemName: isChangeImage ? "sun.max.circle.fill" : "moon.circle.fill").font(.system(size: 100)).tag(1)
                            Image(systemName: isChangeImage ? "sunrise.circle.fill" : "sunset.circle.fill").font(.system(size: 100)).tag(2)
                        }
                    }
                    .frame(width: 200, height: 150)
                    .border(.primary)
                    HStack {
                        Button("Change Image") {
                            withAnimation(.easeInOut(duration: 1)) {
                                isChangeImage.toggle()
                            }
                        }.buttonStyle(.borderedProminent)
                        Button("Change id") {
                            withAnimation(.easeInOut(duration: 1)) {
                                isChangeID.toggle()
                            }
                        }.buttonStyle(.borderedProminent)
                    }
                }
            }
        }
        """
    @State var isChangeImage = false
    @State var isChangeID = false
    var body: some View {
        VStack {
            Text("Create a Canvas with child views")
            CodePreviewView(code: code)
            VStack {
                Canvas { context, size in
                    if let mark = context.resolveSymbol(id: isChangeID ? 1 : 2) {
                        context.draw(mark, at: CGPoint(x: size.width/2, y: size.height/2))
                    }
                } symbols: {
                    Image(systemName: isChangeImage ? "sun.max.circle.fill" : "moon.circle.fill").font(.system(size: 100)).tag(1)
                    Image(systemName: isChangeImage ? "sunrise.circle.fill" : "sunset.circle.fill").font(.system(size: 100)).tag(2)
                }
            }
            .frame(width: 200, height: 150)
            .border(.primary)
            HStack {
                Button("Change Image") {
                    withAnimation(.easeInOut(duration: 1)) {
                        isChangeImage.toggle()
                    }
                }.buttonStyle(.borderedProminent)
                Button("Change id") {
                    withAnimation(.easeInOut(duration: 1)) {
                        isChangeID.toggle()
                    }
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

private struct CreateCanvasSampleView: View {
    var code: String {
        """
        Canvas(opaque: \(opaque.valueString)) { context, size in
            context.stroke(
                Path(ellipseIn: CGRect(origin: .zero, size: size)),
                with: .color(.indigo),
                lineWidth: 5
            )
        }
        .frame(width: 300, height: 200)
        .border(.primary)
        """
    }

    @State var opaque = BoolOption(name: "opaque", value: false)
    var body: some View {
        VStack {
            Text("Create a Canvas")
                .font(.title2)
            CodePreviewView(code: code)
            Canvas(opaque: opaque.value) { context, size in
                context.stroke(
                    Path(ellipseIn: CGRect(origin: .zero, size: size)),
                    with: .color(.indigo),
                    lineWidth: 5
                )
            }
            .frame(width: 300, height: 200)
            .border(.primary)
            BoolOptionView(option: $opaque)
        }
    }
}

struct CanvasControlView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasControlView()
    }
}
