//
//  CreateMapViewWithAnnotation.swift
//  
//
//  Created by 老房东 on 2022-10-04.
//

import SwiftUI
import MapKit

struct CreateMapViewWithAnnotation: View {
    var code = """
    import MapKit
    struct CreateMapViewWithAnnotation: View {
        @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )

        @State private var annotations: [MKAnnotation] = [
            MyAnnotation(title: "Apple", subtitle: "I want to go", coordinate: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965))
        ]

        var body: some View {
            Text("Create MapView with corrdinator")
                .font(.title2)
            MapView(region: $region, annotations: annotations)
                .frame(width: 300, height: 200)
            Text("latitude:\\(region.center.latitude, specifier: "%.2f") longitude\\(region.center.longitude, specifier: "%.2f")")
            HStack {
                Button("Add Annotations") {
                    let number = annotations.count
                    annotations.append(
                        MyAnnotation(
                            title: "Apple\\(number)",
                            subtitle: "I want to go\\(number)",
                            coordinate: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965 - Double(number) * 0.3)
                        )
                    )
                }
                Button("Remove Annotations") {
                    if annotations.isEmpty == false {
                        annotations.removeLast()
                    }
                }
            }
        }
    }

    class MyAnnotation: NSObject, MKAnnotation {
        let coordinate: CLLocationCoordinate2D
        let title: String?
        let subtitle: String?

        init(title: String?,
             subtitle: String?,
             coordinate: CLLocationCoordinate2D)
        {
            self.title = title
            self.subtitle = subtitle
            self.coordinate = coordinate
        }
    }

    struct MapView: UIViewRepresentable {
        typealias UIViewType = MKMapView

        @Binding var region: MKCoordinateRegion
        var lineCoordinates: [CLLocation] = []
        var annotations: [MKAnnotation] = []

        class Coordinator: NSObject, MKMapViewDelegate {
            var control: MapView

            init(_ control: MapView) {
                self.control = control
            }
            
            func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
                control.region = mapView.region
            }
        }

        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView(frame: .zero)
            mapView.delegate = context.coordinator
            mapView.setRegion(region, animated: true)
            return mapView
        }

        func updateUIView(_ mapView: MKMapView, context: Context) {
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations(annotations)
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    }
    """

    @State private var region = MKCoordinateRegion(
        // Apple Park
        center: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )

    @State private var annotations: [MKAnnotation] = [
        MyAnnotation(title: "Apple", subtitle: "I want to go", coordinate: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965))
    ]

    var body: some View {
        VStack{
            Text("Create a MapView using corrdinator")
                .font(.title2)
            CodePreviewView(code: code)
            MapView(region: $region, annotations: annotations)
                .frame(width: .infinity, height: 300)
            Text("latitude:\(region.center.latitude, specifier: "%.2f") longitude\(region.center.longitude, specifier: "%.2f")")
            HStack {
                Button("Add Annotations") {
                    let number = annotations.count
                    annotations.append(
                        MyAnnotation(
                            title: "Apple\(number)",
                            subtitle: "I want to go\(number)",
                            coordinate: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965 - Double(number) * 0.3)
                        )
                    )
                }
                Button("Remove Annotations") {
                    if annotations.isEmpty == false {
                        annotations.removeLast()
                    }
                }
            }
        }
    }
}

private class MyAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?

    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

private struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView

    @Binding var region: MKCoordinateRegion
    var lineCoordinates: [CLLocation] = []
    var annotations: [MKAnnotation] = []

    class Coordinator: NSObject, MKMapViewDelegate {
        var control: MapView

        init(_ control: MapView) {
            self.control = control
        }

        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            control.region = mapView.region
        }
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

struct CreateMapViewWithAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        CreateMapViewWithAnnotation()
    }
}
