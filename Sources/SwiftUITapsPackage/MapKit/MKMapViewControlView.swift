//
//  MKMapViewControlView.swift
//  
//
//  Created by 老房东 on 2022-10-05.
//

import SwiftUI
import MapKit

struct MKMapViewControlView: View {
    var body: some View{
        ScrollView {
            VStack {
                HeadlineView(
                    title: "MKMapView",
                    url: "https://developer.apple.com/documentation/mapkit/mkmapview",
                    description: String(localized: "An embeddable map interface, similar to the one that the Maps app provides.")
                )
                CreateMapViewWithAnnotation()
            }
            .padding()
        }
    }
}

struct MKMapViewControlView_Previews: PreviewProvider {
    static var previews: some View {
        MKMapViewControlView()
    }
}
