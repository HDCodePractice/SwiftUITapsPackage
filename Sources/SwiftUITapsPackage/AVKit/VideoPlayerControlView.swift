//
//  VideoPlayerControlView.swift
//
//
//  Created by 老房东 on 2022-09-26.
//

import AVKit
import Foundation
import SwiftUI

struct VideoPlayerControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "VideoPlayer",
                    url: "https://developer.apple.com/documentation/avkit/videoplayer",
                    description: String(localized: "A view that displays content from a player and a native user interface to control playback.")
                )
                CreateVideoPlayerView()
            }
            .padding()
        }
    }
}

struct CreateVideoPlayerView: View {
    var code: String {
        """
        import AVKit

        struct CreateVideoPlayerView: View {
            let player = AVPlayer(url: Bundle.module.url(forResource: "sample-video", withExtension: "mov")!)
            let endMonitor = NotificationCenter.default.publisher(for: NSNotification.Name.AVPlayerItemDidPlayToEndTime)
            var body: some View {
                VideoPlayer(player: player)
                    .frame(width: \(width.valueString),height: \(height.valueString)
                    .onReceive(endMonitor) { _ in
                        player.seek(to: .zero)
                        player.play()
                    }
            }
        }
        """
    }

    let player = AVPlayer(url: Bundle.module.url(forResource: "sample-video", withExtension: "mov")!)
    let endMonitor = NotificationCenter.default.publisher(for: NSNotification.Name.AVPlayerItemDidPlayToEndTime)

    @State var width = IntOption(name: "width", value: 300, range: 200...350)
    @State var height = IntOption(name: "height", value: 200, range: 100...300)

    var body: some View {
        VStack {
            Text("Create a VideoPlayer")
                .font(.title2)
            CodePreviewView(code: code)
            ZStack {
                VideoPlayer(player: player)
                    .frame(width: CGFloat(width.value), height: CGFloat(height.value))
                    .onReceive(endMonitor) { _ in
                        player.seek(to: .zero)
                        player.play()
                    }
            }
            .frame(width: 350, height: 300)
            .border(.primary)
            HStack{
                Spacer()
                Text("Video:[NickyPe](https://pixabay.com/zh/videos/wood-anemones-wildflower-flower-112429/) Audio:[prazkhanal](https://pixabay.com/zh/music/-goldn-116392/)")
                    .font(.caption).foregroundColor(.secondary)
            }
            IntOptionView(option: $width)
            IntOptionView(option: $height)
        }
    }
}

struct VideoPlayerControlView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerControlView()
    }
}
