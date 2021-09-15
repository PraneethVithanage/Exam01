//
//  DataView.swift
//  ListApp
//
//  Created by praneeth vithanage on 9/15/21.
//


import SwiftUI

struct DataDetail: View {
    var data: data

    var body: some View {
        ScrollView {
//            MapView(coordinate: data.locationCoordinate)
//                .ignoresSafeArea(edges: .top)
//                .frame(height: 300)

            
            HStack {
                data.image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(x: 50)
                Spacer()
            }

            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.title)

                Divider()

                Text("About \(data.name)")
                    .font(.title2)
                Text(data.description)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct dataDetail_Previews: PreviewProvider {
    static var previews: some View {
        dataDetail(data: datas[0])
    }
}
