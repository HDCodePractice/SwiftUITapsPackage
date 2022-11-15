//
//  ListControlView.swift
//
//
//  Created by 老房东 on 2022-10-15.
//

import SwiftUI

struct ListControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "List",
                    url: "https://developer.apple.com/documentation/swiftui/list",
                    description: String(localized: "A container that presents rows of data arranged in a single column, optionally providing the ability to select one or more members.")
                )
                CreateListFromIdentifiableData()
                CreateRowsView()
                Divider()
                CreateSingleSelectionRowsView()
                Divider()
                CreateMultipleSelectionRowView()
            }
            .padding()
        }
    }
}

struct CreateListFromIdentifiableData: View {
    struct Ocean: Identifiable {
        let id = UUID()
        let name: String
    }

    var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]

    @State var selection: String?

    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text("Selected: \(selection ?? "")")
                    List(oceans, selection: $selection) {
                        Text($0.name)
                    }
                    .toolbar {
                        EditButton()
                    }
                }
            }
            .frame(height: 200)
            .border(.primary)
        }
    }
}

private struct CreateMultipleSelectionRowView: View {
    @State var selection: Set<Int> = []

    var body: some View {
        VStack {
            Text("Create a multiple selection rows view")
                .font(.title2)
            NavigationView {
                VStack {
                    EditButton()
                    Text("Selected: \(selection.reduce("") { x, y in "\(x) \(y)" })")
                    List(selection: $selection) {
                        Text("Row 1").tag(1)
                        Text("Row 2").tag(2)
                        Text("Row 3").tag(3)
                    }
                }
            }
            .frame(height: 200)
            .border(.primary)
        }
    }
}

private struct CreateSingleSelectionRowsView: View {
    var code = """
    struct CreateSingleSelectionRowsView: View {
        @State var selection: String? = nil
        var body: some View {
            VStack {
                EditButton()
                Text("Selected: \\(selection ?? "")")
                List(selection: $selection) {
                    Text("Row 1").tag("row1")
                    Text("Row 2").tag("row2")
                    Text("Row 3").tag("row3")
                }
            }
        }
    }
    """
    @State var selection: String? = nil

    var body: some View {
        VStack {
            Text("Create a selection rows view")
                .font(.title2)
            CodePreviewView(code: code)
            NavigationView {
                VStack {
                    EditButton()
                    Text("Selected: \(selection ?? "")")
                    List(selection: $selection) {
                        Text("Row 1").tag("row1")
                        Text("Row 2").tag("row2")
                        Text("Row 3").tag("row3")
                    }
                }
            }
            .frame(height: 200)
            .border(.primary)
        }
    }
}

private struct CreateRowsView: View {
    var code = """
    List{
        Text("Row 1")
        Text("Row 2")
        Text("Row 3")
    }
    """
    var body: some View {
        VStack {
            Text("Create a rows view")
                .font(.title2)
            CodePreviewView(code: code)
            NavigationView {
                List {
                    Text("Row 1")
                    Text("Row 2")
                    Text("Row 3")
                }
            }
            .frame(height: 200)
            .border(.primary)
        }
    }
}

struct ListControlView_Previews: PreviewProvider {
    static var previews: some View {
        ListControlView()
    }
}
