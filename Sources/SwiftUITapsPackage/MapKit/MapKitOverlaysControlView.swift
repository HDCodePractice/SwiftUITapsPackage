//
//  MapKitOverlaysControlView.swift
//
//
//  Created by 老房东 on 2022-10-05.
//

import MapKit
import SwiftUI

struct MapKitOverlaysControlView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeadlineView(
                    title: "MapKit overlays",
                    url: "https://developer.apple.com/documentation/mapkit/mapkit_overlays",
                    description: String(localized: "Create overlays to highlight geographic regions or paths.")
                )
                MapHasPolylinesView()
            }
            .padding()
        }
    }
}

private struct MapHasPolylinesView: View {
    var code = """
    struct MapHasPolylinesView: View {
        @State var lineCoordinates: [CLLocationCoordinate2D] = [
            CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965)
        ]

        var body: some View {
            VStack {
                MapView(lineCoordinates: lineCoordinates)
                    .frame(width: .infinity, height: 300)
                HStack {
                    Button("Add one") {
                        let number = Double(lineCoordinates.count)
                        let newCoordinate = CLLocationCoordinate2D(
                            latitude: 37.334803+0.01*number,
                            longitude: -122.008965+0.01*number
                        )
                        lineCoordinates.append(newCoordinate)
                    }
                    Button("Remove last") {
                        if lineCoordinates.count > 1 {
                            lineCoordinates.removeLast()
                        }
                    }
                }
            }
        }
    }

    struct MapView: UIViewRepresentable {
        typealias UIViewType = MKMapView
        let lineCoordinates: [CLLocationCoordinate2D]
        var annotations : [MKPointAnnotation] {
            lineCoordinates.map { coordinate in
                let annotation  = MKPointAnnotation.init()
                annotation.coordinate = coordinate
                return annotation
            }
        }
        let mapZoomEdgeInsets = UIEdgeInsets(
            top: 30.0,
            left: 30.0,
            bottom: 30.0,
            right: 30.0 )

        class Coordinator: NSObject, MKMapViewDelegate {
            var parent: MapView

            init(_ parent: MapView) {
                self.parent = parent
            }

            func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
                let renderer = MKPolylineRenderer(overlay: overlay)
                renderer.strokeColor = .blue
                renderer.lineWidth = 3.0
                return renderer
            }
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView()
            mapView.delegate = context.coordinator
            return mapView
        }

        func updateUIView(_ mapView: MKMapView, context: Context) {
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations(annotations)
            mapView.removeOverlays(mapView.overlays)
            let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
            mapView.addOverlay(polyline)
            setMapZoomArea(map: mapView, polyline: polyline, edgeInsets: mapZoomEdgeInsets, animated: true)
        }

        private func setMapZoomArea(map: MKMapView, polyline: MKPolyline, edgeInsets: UIEdgeInsets, animated: Bool = false) {
            map.setVisibleMapRect(polyline.boundingMapRect, edgePadding: edgeInsets, animated: animated)
        }
    }
    """

    @State var lineCoordinates: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965)
    ]

    var body: some View {
        VStack {
            Text("Create a MapKit overlays")
                .font(.title2)
            CodePreviewView(code: code)
            MapView(lineCoordinates: lineCoordinates)
                .frame(width: .infinity, height: 300)
            HStack {
                Button("Add one") {
                    let number = Double(lineCoordinates.count)
                    let newCoordinate = CLLocationCoordinate2D(latitude: 37.334803+0.01*number, longitude: -122.008965+0.01*number)
                    lineCoordinates.append(newCoordinate)
                }
                Button("Remove last") {
                    let number = lineCoordinates.count
                    if number > 1 {
                        lineCoordinates.removeLast()
                    }
                }
            }
        }
    }
}

private struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    let lineCoordinates: [CLLocationCoordinate2D]
    var annotations: [MKPointAnnotation] {
        lineCoordinates.map { coordinate in
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            return annotation
        }
    }

    let mapZoomEdgeInsets = UIEdgeInsets(top: 30.0, left: 30.0, bottom: 30.0, right: 30.0)

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 3.0
            return renderer
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
        mapView.removeOverlays(mapView.overlays)
        let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
        mapView.addOverlay(polyline)
        setMapZoomArea(map: mapView, polyline: polyline, edgeInsets: mapZoomEdgeInsets, animated: true)
    }

    private func setMapZoomArea(map: MKMapView, polyline: MKPolyline, edgeInsets: UIEdgeInsets, animated: Bool = false) {
        map.setVisibleMapRect(polyline.boundingMapRect, edgePadding: edgeInsets, animated: animated)
    }
}

struct MapKitOverlaysControlView_Previews: PreviewProvider {
    static var previews: some View {
        MapKitOverlaysControlView()
    }
}
