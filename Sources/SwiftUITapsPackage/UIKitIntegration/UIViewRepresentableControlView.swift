//
//  UIViewRepresentableControlView.swift
//
//
//  Created by 老房东 on 2022-10-01.
//

import MapKit
import SwiftUI

struct UIViewRepresentableControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "UIViewRepresentable",
                    url: "https://developer.apple.com/documentation/swiftui/uiviewrepresentable",
                    description: String(localized: "A wrapper for a UIKit view that you use to integrate that view into your SwiftUI view hierarchy.")
                )
                CreateMapView()
                Divider()
                CreateMapViewWithAnnotation()
            }
            .padding()
        }
    }
}

private struct CreateMapView: View {
    var code = """
    import MapKit
    import SwiftUI

    struct MapView: UIViewRepresentable {
        typealias UIViewType = MKMapView
        var region: MKCoordinateRegion

        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView(frame: .zero)
            mapView.setRegion(region, animated: true)
            return mapView
        }

        func updateUIView(
            _ uiView: MKMapView,
            context: Context) {}
    }

    struct CreateMapView: View {
        @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )

        var body: some View {
            VStack {
                Text("Create MapView")
                    .font(.title2)
                MapView(region: region)
                    .frame(width: 300, height: 200)
            }
        }
    }
    """
    @State private var region = MKCoordinateRegion(
        // Apple Park
        center: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )

    var body: some View {
        VStack {
            Text("Create a MapView from MKMapView")
                .font(.title2)
            CodePreviewView(code: code)
            MapView(region: region)
                .frame(width: 300, height: 200)
        }
    }
}


private struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    var region: MKCoordinateRegion

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.setRegion(region, animated: true)
        return mapView
    }

    func updateUIView(
        _ uiView: MKMapView,
        context: Context) {}
}


struct UIViewRepresentableControlView_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableControlView()
    }
}
