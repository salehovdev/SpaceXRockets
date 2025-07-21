//
//  RocketsRowView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 20.07.25.
//

import SwiftUI

struct RocketsRowView: View {
    let rocket: Rockets
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(rocket.name)
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Label("First flight date:", systemImage: "calendar")
                Text(rocket.firstFlight)
            }
            
            HStack {
                Label("Success Rate:", systemImage: "star.fill")
                Text("\(rocket.successRatePct)%")
            }
            
            Divider()
            
            HStack(spacing: 16) {
                VStack {
                    Text("Height")
                        .font(.caption)
                    Text("\(rocket.height.meters ?? 0, specifier: "%.1f") m")
                        .font(.subheadline)
                    Text("\(rocket.height.feet ?? 0, specifier: "%.1f") ft")
                        .font(.subheadline)
                }
                
                VStack {
                    Text("Diameter")
                        .font(.caption)
                    Text("\(rocket.diameter.meters ?? 0, specifier: "%.1f") m")
                        .font(.subheadline)
                    Text("\(rocket.diameter.feet ?? 0, specifier: "%.1f") ft")
                        .font(.subheadline)
                }
                
                VStack {
                    Text("Mass")
                        .font(.caption)
                    Text("\(rocket.mass.kg) kg")
                        .font(.subheadline)
                    Text("\(rocket.mass.lb) lb")
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 1)
    }
}

#Preview {
    RocketsRowView(rocket: .init(id: "", name: "Fuad", firstFlight: "24-06-1995", successRatePct: 2, mass: Mass(kg: 3, lb: 2), height: Diameter(meters: 12, feet: 12), diameter: Diameter(meters: 12, feet: 23)))
}
