//
//  DetailsList.swift
//  ListApp
//
//  Created by praneeth vithanage on 9/15/21.
//

import SwiftUI

struct DataList: View {
    var body: some View {
        NavigationView {
            List(Datas) { Data in
                NavigationLink(destination: DataDetail(Data: Data)) {
                    DataRow(Data: Data)
                }
            }
            .navigationTitle("")
            .background(Color.green)
        }
    }
}

struct DataList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            DataList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
