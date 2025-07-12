//
//  LocationsListView.swift
//  TimeScape
//
//  Created by Okan Orkun on 12.07.2025.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List(viewModel.locations) { location in
            Button {
                viewModel.showNextLocation(location: location)
            } label: {
                listRowView(location: location)
            }
            .padding(.vertical, 4)
            .listRowBackground(Color.clear)
        }
            .listStyle(.plain)
    }
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
