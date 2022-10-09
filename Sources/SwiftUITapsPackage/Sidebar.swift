import SwiftUI

public struct Sidebar: View {
    public init() {}
    public var body: some View {
        List {
            Group {
                Section("State and data flow") {
                    NavigationLink("AppStorage") {
                        AppStorageControlView()
                    }
                }
                
                Section("Text input and output") {
                    NavigationLink("Label") {
                        LabelControlView()
                    }
                    NavigationLink("Text") {
                        TextControlView()
                    }
                }
                
                Section("Images") {
                    NavigationLink("Image") {
                        ImageControlView()
                    }
                }
                
                Section("Controls and indicators") {
                    NavigationLink("Button") {
                        ButtonControlView()
                    }
                    NavigationLink("Menu") {
                        MenuControlView()
                    }
                    NavigationLink("Slider"){
                        SliderControlView()
                    }
                }
                
                Section("Shapes") {
                    NavigationLink("Rectangular shapes") {
                        RectangularShapesControlView()
                    }
                    NavigationLink("Circular shapes") {
                        CircularShapesControlView()
                    }
                    NavigationLink("Path") {
                        PathControlView()
                    }
                }
                
                Section("Drawing and graphics"){
                    NavigationLink("Canvas"){
                        CanvasControlView()
                    }
                }
                
                Section("Layout containers") {
                    NavigationLink("VStack") {
                        VStackControlView()
                    }
                    NavigationLink("ZStack") {
                        ZStackControlView()
                    }
                    NavigationLink("Divider") {
                        DividerControlView()
                    }
                }
                
                Section("Collection containers") {
                    NavigationLink("ForEach") {
                        ForEachControlView()
                    }
                }
            }
            Group {
                Section("Animations") {
                    NavigationLink("withAnimation") {
                        WithAnimationControlView()
                    }
                    NavigationLink(""){
                        AnimationControlView()
                    }
                    NavigationLink("Animatable") {
                        AnimatableControlView()
                    }
                }
                
                Section("Input and event modifiers") {
                    NavigationLink("Keyboard shortcuts") {
                        KeyboardShortcutsControlView()
                    }
                }
                
                Section("UIKit integration"){
                    NavigationLink("UIViewRepresentable"){
                        UIViewRepresentableControlView()
                    }
                }
                
                Section("MapKit") {
                    NavigationLink("Map") {
                        MapControlView()
                    }
                    NavigationLink("MKMapView"){
                        MKMapViewControlView()
                    }
                    NavigationLink("MapKit overlays"){
                        MapKitOverlaysControlView()
                    }
                }
                
                Section("AVKit") {
                    NavigationLink("VideoPlayer"){
                        VideoPlayerControlView()
                    }
                    NavigationLink("AVAudioPlayer"){
                        AVAudioPlayerControlView()
                    }
                    NavigationLink("AVPlayer"){
                        AVPlayerControlView()
                    }
                }
            }
        }
        #if !os(macOS)
        .listStyle(.insetGrouped)
        #endif
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
