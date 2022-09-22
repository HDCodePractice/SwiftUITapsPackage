import SwiftUI

public struct Sidebar: View {
    public init(){}
    public var body: some View {
        List{
            Section("State and data flow"){
                NavigationLink("AppStorage"){
                    AppStorageControlView()
                }
            }
            
            Section("Text input and output"){
                NavigationLink("Label"){
                    LabelControlView()
                }
                NavigationLink("Text"){
                    TextControlView()
                }
            }
            
            Section("Images"){
                NavigationLink("Image"){
                    ImageControlView()
                }
            }
            
            Section("Controls and indicators"){
                NavigationLink("Button"){
                    ButtonControlView()
                }
                NavigationLink("Menu"){
                    MenuControlView()
                }
            }
            
            Section("Shapes"){
                NavigationLink("Rectangular Shapes"){
                    RectangularShapesControlView()
                }
            }
            
            Section("Layout containers"){
                NavigationLink("VStack"){
                    VStackControlView()
                }
                NavigationLink("ZStack"){
                    ZStackControlView()
                }
                NavigationLink("Divider"){
                    DividerControlView()
                }
            }
            
            Section("Collection containers"){
                NavigationLink("ForEach"){
                    ForEachControlView()
                }
            }
            
            Section("Animations"){
                NavigationLink("withAnimation"){
                    WithAnimationControlView()
                }
                NavigationLink("Animatable"){
                    AnimatableControlView()
                }
            }
            
            Section("Input and event modifiers"){
                NavigationLink("Keyboard shortcuts"){
                    KeyboardShortcutsControlView()
                }
            }
            
            Section("Map"){
                NavigationLink("Map"){
                    MapControlView()
                }
            }
            
        }.listStyle(.insetGrouped)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
