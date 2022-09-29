//
//  SwiftUIView.swift
//
//
//  Created by 老房东 on 2022-09-28.
//

import AVFoundation
import SwiftUI

struct AVPlayerControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "AVPlayer",
                    url: "https://developer.apple.com/documentation/avfoundation/avplayer",
                    description: String(localized: "An object that provides the interface to control the player’s transport behavior.")
                )
                CreateAVPlayerSampleView()
            }
            .padding()
        }
    }
}

private struct PlayAudio: View {
    var player: AVPlayer

    public init(url: String) {
        player = AVPlayer(url: URL(string: url)!)
    }

    public var body: some View {
        Button(action: {
            player.seek(
                to: CMTime(
                    seconds: 0,
                    preferredTimescale: 10
                )
            )
            player.play()
        }) {
            Image(systemName: "play.circle.fill")
                .font(.largeTitle)
        }
    }
}

private struct CreateAVPlayerSampleView: View {
    var code = """
    struct PlayAudio: View {
        var player: AVPlayer

        public init(url: String) {
            player = AVPlayer(url: URL(string: url)!)
        }

        public var body: some View {
            Button(action: {
                player.seek(to: CMTime(seconds: 0, preferredTimescale: 10))
                player.play()
            }) {
                Image(systemName: "play.circle.fill").resizable()
                    .font(.largeTitle)
            }
        }
    }

    struct CreateAVPlayerSampleView: View {
        var body: some View {
            PlayAudio(url: "https://raw.githubusercontent.com/HDCodePractice/EnglishHelper/main/res/audio/Food/Chinese%20Restaurant/orange%20flavored%20chicken.wav")
        }
    }
    """
    var body: some View {
        Text("Create a AVPlayer")
            .font(.title2)
        CodePreviewView(code: code)
        PlayAudio(url: "https://raw.githubusercontent.com/HDCodePractice/EnglishHelper/main/res/audio/Food/Chinese%20Restaurant/orange%20flavored%20chicken.wav")
    }
}

struct AVPlayerControlView_Previews: PreviewProvider {
    static var previews: some View {
        AVPlayerControlView()
    }
}
