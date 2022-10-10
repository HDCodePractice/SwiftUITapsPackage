//
//  SwiftUIView.swift
//
//
//  Created by 老房东 on 2022-10-09.
//

import SwiftUI

struct AnimationControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "animation",
                    url: "https://developer.apple.com/documentation/swiftui/view/animation(_:value:)",
                    description: String(localized: "Applies the given animation to this view when the specified value changes.")
                )
                SimpleAnimationSampleView()
                Divider()
                MutiAnimationSampleView()
            }
            .padding()
        }
    }
}

struct MutiAnimationSampleView: View {
    var code = """
    struct MutiAnimationSampleView: View {
        @State var animateHeight = false
        @State var animateWidth = false

        var body: some View {
            VStack {
                ZStack {
                    Color.red
                    Rectangle()
                        .fill(.white)
                        .scaleEffect(animateHeight ? 1.4 : 1)
                        .frame(
                            width: animateWidth ? 300 : 60,
                            height: animateHeight ? 200 : 20
                        )
                        .shadow(color: .white, radius: 20)
                        .shadow(color: .white, radius: 20)
                        .animation(
                            .linear(duration: 0.2),
                            value: animateWidth
                        )
                }
                .frame(height: 200)
                Button("Start Animation") {
                    animateWidth.toggle()
                    withAnimation(.linear(duration: 0.5).delay(0.5)) {
                        animateHeight.toggle()
                    }
                }
            }
        }
    }
    """
    @State var animateHeight = false
    @State var animateWidth = false

    var body: some View {
        VStack {
            Text("Mix animation and withAnimation")
                .font(.title2)
            CodePreviewView(code: code)
            ZStack {
                Color.red
                Rectangle()
                    .fill(.white)
                    .scaleEffect(animateHeight ? 1.4 : 1)
                    .frame(width: animateWidth ? 300 : 60, height: animateHeight ? 200 : 20)
                    .shadow(color: .white, radius: 20)
                    .shadow(color: .white, radius: 20)
                    .animation(.linear(duration: 0.2), value: animateWidth)
            }
            .frame(height: 200)
            Button("Start Animation") {
                animateWidth.toggle()
                withAnimation(.linear(duration: 0.5).delay(0.5)) {
                    animateHeight.toggle()
                }
            }
        }
    }
}

private struct SimpleAnimationSampleView: View {
    var code: String {
        """
        struct SimpleAnimationSampleView: View {
            @State var isAnimation = false
            var body: some View {
                VStack{
                    ZStack{
                        Text("easeIn").font(.footnote)
                        Circle()
                            .fill(.cyan)
                            .frame(width: 30)
                            .animation(.easeIn(duration: \(duration.valueString), value: isAnimation)
                            .offset(x: isAnimation ? 150 : -150)
                    }
                    ZStack{
                        Text("easeOut").font(.footnote)
                        Circle()
                            .fill(.cyan)
                            .frame(width: 30)
                            .animation(.easeOut(duration: \(duration.valueString)), value: isAnimation)
                            .offset(x: isAnimation ? 150 : -150)
                    }
                    ZStack{
                        Text("easeInOut").font(.footnote)
                        Circle()
                            .fill(.cyan)
                            .frame(width: 30)
                            .animation(.easeInOut(duration: \(duration.valueString)), value: isAnimation)
                            .offset(x: isAnimation ? 150 : -150)
                    }
                    ZStack{
                        Text("linear").font(.footnote)
                        Circle()
                            .fill(.cyan)
                            .frame(width: 30)
                            .animation(.linear(duration: \(duration.valueString)), value: isAnimation)
                            .offset(x: isAnimation ? 150 : -150)
                    }
                    Button("Start Animation"){
                        isAnimation.toggle()
                    }
                }
            }
        }
        """
    }

    @State var duration = DoubleOption(name: "duration", value: 0.5, range: 0 ... 2)
    @State var isAnimation = false
    var body: some View {
        VStack {
            Text("Call animation function")
                .font(.title2)
            CodePreviewView(code: code)
            ZStack {
                Text("easeIn").font(.footnote)
                Circle()
                    .fill(.cyan)
                    .frame(width: 30)
                    .animation(.easeIn(duration: duration.value), value: isAnimation)
                    .offset(x: isAnimation ? 150 : -150)
            }
            ZStack {
                Text("easeOut").font(.footnote)
                Circle()
                    .fill(.cyan)
                    .frame(width: 30)
                    .animation(.easeOut(duration: duration.value), value: isAnimation)
                    .offset(x: isAnimation ? 150 : -150)
            }
            ZStack {
                Text("easeInOut").font(.footnote)
                Circle()
                    .fill(.cyan)
                    .frame(width: 30)
                    .animation(.easeInOut(duration: duration.value), value: isAnimation)
                    .offset(x: isAnimation ? 150 : -150)
            }
            ZStack {
                Text("linear").font(.footnote)
                Circle()
                    .fill(.cyan)
                    .frame(width: 30)
                    .animation(.linear(duration: duration.value), value: isAnimation)
                    .offset(x: isAnimation ? 150 : -150)
            }
            DoubleOptionView(option: $duration)
            Button("Start Animation") {
                isAnimation.toggle()
            }
        }
    }
}

struct AnimationControlView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationControlView()
    }
}
