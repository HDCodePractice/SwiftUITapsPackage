//
//  LazyHGridControlView.swift
//  
//
//  Created by 老房东 on 2022-10-20.
//

import SwiftUI

struct LazyVGridControlView: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, .mint, .cyan]
    let columns = [
        GridItem(.flexible(minimum: 20, maximum: .infinity)),
        GridItem(.flexible(minimum: 20, maximum: .infinity)),
        GridItem(.flexible(minimum: 20, maximum: .infinity))
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(0..<210){ index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(colors[index/3%9])
                }
            }
        }
        .frame(width: 100,height: 300)
        .border(.primary)
    }
}

struct LazyVGridControlView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridControlView()
    }
}
