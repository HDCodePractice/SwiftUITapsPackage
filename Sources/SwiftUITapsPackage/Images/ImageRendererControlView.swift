//
//  ImageRendererControlView.swift
//
//
//  Created by 老房东 on 2022-11-14.
//

import SwiftUI

struct ImageRendererControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "ImageRenderer",
                    url: "https://developer.apple.com/documentation/swiftui/imagerenderer",
                    description: String(localized: "An object that creates images from SwiftUI views.")
                )
                if #available(iOS 16.0, *) {
                    CreateImageFromView()
                } else {
                    Text("Please upgrade your system to iOS16.")
                }
                Divider()
            }
            .padding()
        }
    }
}

private struct DemoView: View {
    let name: String

    var body: some View {
        VStack {
            Image(systemName: "trophy")
                .resizable()
                .frame(width: 200, height: 200)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .shadow(color: .mint, radius: 5)
            Text(name)
                .font(.largeTitle)
        }
    }
}

@available(iOS 16.0, *)
struct CreateImageFromView: View {
    @State var showImage: Image? = nil
    var code = """
    struct DemoView: View {
        let name: String

        var body: some View {
            VStack {
                Image(systemName: "trophy")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .shadow(color: .mint, radius: 5)
                Text(name)
                    .font(.largeTitle)
            }
        }
    }

    struct CreateImageFromView: View {
        @State var showImage: Image? = nil

        var body: some View {
            VStack {
                DemoView(name: "player1")
                if let showImage {
                    showImage
                }
                Button("Render Image") {
                    let renderer = ImageRenderer(content: DemoView(name: "player1"))
                    if let image = renderer.uiImage {
                        showImage = Image(uiImage: image)
                    }
                }
            }
        }
    }
    """
    
    var body: some View {
        VStack {
            CodePreviewView(code: code)
            DemoView(name: "player1")
            if let showImage {
                showImage
            }
            Button("Render Image") {
                let renderer = ImageRenderer(content: DemoView(name: "player1"))
                if let image = renderer.uiImage {
                    showImage = Image(uiImage: image)
                }
            }
        }
    }
}

struct ImageRendererControlView_Previews: PreviewProvider {
    static var previews: some View {
        ImageRendererControlView()
    }
}
