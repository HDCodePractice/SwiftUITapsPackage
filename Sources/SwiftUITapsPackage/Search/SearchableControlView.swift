//
//  SearchableControlView.swift
//
//
//  Created by 老房东 on 2022-11-19.
//

import SwiftUI

struct SearchableControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "searchable",
                    url: "https://developer.apple.com/documentation/swiftui/adding-search-to-your-app",
                    description: String(localized: "Marks this view as searchable, which configures the display of a search field.")
                )
                CreateSearchableDemoView()
                Divider()
                CreateSearchableFilterView()
                Divider()
                CreateSearchableSuggestionsView()
                Divider()
                CreateSearchableDynamicSuggestionsView()
            }
            .padding()
        }
    }
}

struct CreateSearchableDynamicSuggestionsView: View {
    var code = """
    struct CreateSearchableDynamicSuggestionsView: View {
        let cities = ["Montreal", "Toronto", "Vancouver", "Quebec", "Ottawa", "Boston", "New York"]

        var citiesFilter: [String] {
            if query.isEmpty {
                return cities
            } else {
                return cities.filter { $0.localizedCaseInsensitiveContains(query) }
            }
        }

        @State var query = ""
        var body: some View {
            VStack {
                NavigationView {
                    Text(query)
                        .font(.body)
                        .searchable(text: $query, prompt: "two suggestions") {
                            ForEach(citiesFilter, id: \\.self) { suggestion in
                                Text(suggestion).searchCompletion(suggestion)
                            }
                        }
                        .autocapitalization(.none)
                        .border(.black)
                }
                .frame(height: 200)
            }
        }
    }
    """
    let cities = ["Montreal", "Toronto", "Vancouver", "Quebec", "Ottawa", "Boston", "New York"]

    var citiesFilter: [String] {
        if query.isEmpty {
            return cities
        } else {
            return cities.filter { $0.localizedCaseInsensitiveContains(query) }
        }
    }

    @State var query = ""
    var body: some View {
        VStack {
            Text("Create a search suggestions")
                .font(.title2)
            CodePreviewView(code: code)
            NavigationView {
                Text(query)
                    .font(.body)
                    .searchable(text: $query, prompt: "two suggestions") {
                        ForEach(citiesFilter, id: \.self) { suggestion in
                            Text(suggestion).searchCompletion(suggestion)
                        }
                    }
                    .autocapitalization(.none)
                    .border(.black)
            }
            .frame(height: 200)
        }
    }
}

struct CreateSearchableSuggestionsView: View {
    var code = """
    struct CreateSearchableSuggestionsView: View {
        let cities = ["Montreal", "Toronto", "Vancouver", "Quebec", "Ottawa", "Boston", "New York"]

        var citiesFilter: [String] {
            if query.isEmpty {
                return cities
            } else {
                return cities.filter { $0.localizedCaseInsensitiveContains(query) }
            }
        }

        @State var query = ""
        var body: some View {
            VStack {
                NavigationView {
                    List(citiesFilter, id: \\.self) { city in
                        Text(city)
                    }
                    .searchable(text: $query, prompt: "city search") {
                        Text("Montréal").searchCompletion("montreal")
                        Text("Québec").searchCompletion("quebec")
                        Image(systemName: "leaf.fill")
                            .symbolRenderingMode(.multicolor)
                            .searchCompletion("toronto")
                    }
                }
            }
        }
    }
    """
    let cities = ["Montreal", "Toronto", "Vancouver", "Quebec", "Ottawa", "Boston", "New York"]

    var citiesFilter: [String] {
        if query.isEmpty {
            return cities
        } else {
            return cities.filter { $0.localizedCaseInsensitiveContains(query) }
        }
    }

    @State var query = ""
    var body: some View {
        VStack {
            Text("Create a search suggestions")
                .font(.title2)
            CodePreviewView(code: code)
            NavigationView {
                List(citiesFilter, id: \.self) { city in
                    Text(city)
                }
                .searchable(text: $query, prompt: "city search") {
                    Text("Montréal").searchCompletion("montreal")
                    Text("Québec").searchCompletion("quebec")
                    Image(systemName: "leaf.fill")
                        .symbolRenderingMode(.multicolor)
                        .searchCompletion("toronto")
                }
            }
        }
    }
}

struct CreateSearchableFilterView: View {
    var code = """
    struct CreateSearchableFilterView: View {
        let cities = ["Montreal", "Toronto", "Vancouver", "Quebec", "Ottawa", "Boston", "New York"]

        var citiesFilter: [String] {
            if query.isEmpty {
                return cities
            } else {
                return cities.filter{ $0.localizedCaseInsensitiveContains(query) }
            }
        }

        @State var query = ""
        var body: some View {
            NavigationView {
                List(citiesFilter, id:\\.self){ city in
                    Text(city)
                }
                .searchable(text: $query, prompt: "city search")
            }
        }
    }
    """
    let cities = ["Montreal", "Toronto", "Vancouver", "Quebec", "Ottawa", "Boston", "New York"]

    var citiesFilter: [String] {
        if query.isEmpty {
            return cities
        } else {
            return cities.filter { $0.localizedCaseInsensitiveContains(query) }
        }
    }

    @State var query = ""
    var body: some View {
        VStack {
            Text("Create a search and filter list")
                .font(.title2)
            CodePreviewView(code: code)
            NavigationView {
                List(citiesFilter, id: \.self) { city in
                    Text(city)
                }
                .searchable(text: $query, prompt: "city search")
            }
        }
    }
}

private struct CreateSearchableDemoView: View {
    var code = """
    struct CreateSearchableDemoView: View {
        @State var searchText = ""
        var body: some View {
            VStack{
                NavigationView {
                    HStack{
                        Text("your search is: \\(searchText)")
                        Spacer()
                    }
                    .searchable(text: $searchText, prompt: "Input text")
                }
            }
        }
    }
    """
    @State var searchText = ""
    var body: some View {
        VStack {
            Text("Create search in Navigation")
                .font(.title2)
            CodePreviewView(code: code)
            NavigationView {
                HStack(alignment: .top) {
                    Text("your search is: \(searchText)")
                    Spacer()
                }
                .searchable(text: $searchText, prompt: "Input text")
            }
            .frame(height: 200)
        }
    }
}

struct SearchableControlView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableControlView()
    }
}
