//
//  PasteboardControlView.swift
//
//
//  Created by 老房东 on 2022-10-12.
//

import SwiftUI

struct PasteboardControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "UIPasteboard",
                    url: "https://developer.apple.com/documentation/uikit/uipasteboard",
                    description: String(localized: "An object that helps a user share data from one place to another within your app, and from your app to other apps.")
                )
                SimpleCopyAndPasteStringSample()
            }
            .padding()
        }
    }
}

struct SimpleCopyAndPasteStringSample: View {
    var code = """
    @State var copyText = ""
    @State var pasteText = ""
    var body: some View {
        VStack {
            Text("Copy and paste a String")
                .font(.title2)
            CodePreviewView(code: code)
            TextField("Input text", text: $copyText)
                .textFieldStyle(.roundedBorder)
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Button{
                            pasteText = UIPasteboard.general.string ?? ""
                        }label: {
                            Image(systemName: "doc.on.clipboard")
                        }
                    }
                }
            Text("Paste:\\(pasteText)")
            HStack {
                Button("Copy") {
                    if !copyText.isEmpty {
                        UIPasteboard.general.string = copyText
                    }
                }
                Button("Paste") {
                    pasteText = UIPasteboard.general.string ?? ""
                }
            }
        }
    }
    """
    @State var copyText = ""
    @State var pasteText = ""
    var body: some View {
        VStack {
            Text("Copy and paste a String")
                .font(.title2)
            CodePreviewView(code: code)
            TextField("Input text", text: $copyText)
                .textFieldStyle(.roundedBorder)
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Button{
                            pasteText = UIPasteboard.general.string ?? ""
                        }label: {
                            Image(systemName: "doc.on.clipboard")
                        }
                        Spacer()
                    }
                }
            Text("Paste:\(pasteText)")
            HStack {
                Button("Copy") {
                    if !copyText.isEmpty {
                        UIPasteboard.general.string = copyText
                    }
                }
                Button("Paste") {
                    pasteText = UIPasteboard.general.string ?? ""
                }
            }
        }
    }
}

struct PasteboardControlView_Previews: PreviewProvider {
    static var previews: some View {
        PasteboardControlView()
    }
}
