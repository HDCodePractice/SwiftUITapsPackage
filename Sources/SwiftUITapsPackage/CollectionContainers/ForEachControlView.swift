//
//  ForEachControlView.swift
//
//
//  Created by 老房东 on 2022-09-20.
//

import SwiftUI

struct ForEachControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "ForEach",
                    url: "https://developer.apple.com/documentation/SwiftUI/ForEach",
                    description: "A structure that computes views on demand from an underlying collection of identified data."
                )
                ForEachRangeIntView()
                Divider()
                ForEachIdentifiableView()
            }
            .padding()
        }
    }
}

private struct ForEachIdentifiableView: View {
    var code = """
    @State var colors: [Color] = [.cyan, .gray, .mint]
    struct User: Identifiable {
        var id = UUID()
        var name: String
    }

    @State var users = [
        User(name: "A"),
        User(name: "B"),
        User(name: "C")
    ]
    var body: some View {
        VStack {
            Text("Data Not Conforming to Identifiable")
            HStack {
                ForEach(colors, id: \\.self) { color in
                    Text(color.description.capitalized)
                        .padding()
                        .background(color)
                }
            }
            Divider()
            Text("Data Conforming to Identifiable")
            HStack {
                ForEach(users) { user in
                    Text(user.name)
                }
            }
            HStack {
                ForEach(users,id: \\.name) { user in
                    Text(user.name)
                }
            }
        }
    }
    """
    @State var colors: [Color] = [.cyan, .gray, .mint]
    struct User: Identifiable {
        var id = UUID()
        var name: String
    }

    @State var users = [
        User(name: "A"),
        User(name: "B"),
        User(name: "C")
    ]
    var body: some View {
        VStack {
            Text("ForEach Identifiable")
                .font(.title2)
            CodePreviewView(code: code)
            Text("Data Not Conforming to Identifiable")
            VStack {
                HStack {
                    ForEach(colors, id: \.self) { color in
                        Text(color.description.capitalized)
                            .padding()
                            .background(color)
                    }
                }
                Divider()
                Text("Data Conforming to Identifiable")
                HStack {
                    ForEach(users) { user in
                        Text(user.name)
                    }
                }
                HStack {
                    ForEach(users, id: \.name) { user in
                        Text(user.name)
                    }
                }
            }
            .padding()
            .border(.primary)
        }
    }
}

private struct ForEachRangeIntView: View {
    var code = """
    @State var count = 3
    var body: some View {
            VStack{
                Text("from a range")
                HStack {
                    ForEach(0..<3) { index in
                        Text("\\(index)")
                    }
                }
                Divider()
                Text("from data")
                HStack {
                    ForEach(0..<count, id: \\.self) { index in
                        Text("\\(index)")
                    }
                }
            }
    }
    """
    @State var count = 3
    var body: some View {
        VStack {
            Text("Creating a collection")
                .font(.title2)
            CodePreviewView(code: code)
            VStack {
                Text("from a range")
                HStack {
                    ForEach(0..<3) { index in
                        Text("\(index)")
                    }
                }
                Divider()
                Text("from data")
                HStack {
                    ForEach(0..<count, id: \.self) { index in
                        Text("\(index)")
                    }
                }
            }
            .padding()
            .border(.primary)
        }
    }
}

struct ForEachControlView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachControlView()
    }
}
