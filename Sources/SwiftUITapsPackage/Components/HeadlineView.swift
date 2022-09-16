import SwiftUI

public struct HeadlineView: View {
    public var title: String
    public var url: String
    public var description: String
    public var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Text(title)
                    .font(.largeTitle)
                LinkView(url: url)
                Spacer()
            }
            Text(description)
            Divider()
        }
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView(title: "VStack", url: "https://developer.apple.com/documentation/swiftui/vstack", description: "A view that arranges its subviews in a vertical line.")
    }
}
