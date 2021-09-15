//
//  DataRow.swift
//  ListApp
//
//  Created by praneeth vithanage on 9/15/21.
//

import Foundation
import SwiftUI

struct DataRow: View {
    var data: data

    var body: some View {
        HStack {
            data.image
                .resizable()
                .frame(width: 50, height: 50)
           
            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.title3)
                Text("Aboutm About About About About ")
                    .font(.system(size: 10))
            
            }
            .padding()

            Spacer()
        }
        
        
    }
}

struct dataRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            dataRow(data: datas[0])
            dataRow(data: datas[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
