import SwiftUI

public struct HeadlineView: View {
    var title: String
    var url: String
    var description: String

    public init(title: String, url: String, description: String) {
        self.title = title
        self.url = url
        self.description = description
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
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
