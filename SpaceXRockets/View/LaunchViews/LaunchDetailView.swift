//
//  LaunchDetailView.swift
//  SpaceXRockets
//
//  Created by Fuad Salehov on 21.07.25.
//

import SwiftUI

struct LaunchDetailView: View {
    let launch: Launches
    @State private var showSafari = false
    @State private var selectedURL: URL?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let imageUrl = URL(string: launch.links.patch.large ?? "") {
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(12)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                Text(launch.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Date: \(formattedDate(launch.dateLocal))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Success: \(launch.success == true ? "Yes" : "No")")
                    .font(.subheadline)
                    .foregroundColor(launch.success == true ? .green : .red)
                
                if let details = launch.details {
                    Text(details)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                }
                
                HStack {
                    if let wiki = launch.links.wikipedia, let url = URL(string: wiki) {
                        LinkButton(title: "Wikipedia", url: url, selectedURL: $selectedURL, showSafari: $showSafari)
                    }
                    
                    if let article = launch.links.article, let url = URL(string: article) {
                        LinkButton(title: "Article", url: url, selectedURL: $selectedURL, showSafari: $showSafari)
                    }
                }

                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showSafari) {
            if let url = selectedURL {
                SafariView(url: url)
            }
        }
    }
    
    func formattedDate(_ isoDate: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: isoDate) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            displayFormatter.timeStyle = .none
            return displayFormatter.string(from: date)
        }
        return isoDate
    }
}

struct LinkButton: View {
    let title: String
    let url: URL
    @Binding var selectedURL: URL?
    @Binding var showSafari: Bool

    var body: some View {
        Button {
            selectedURL = url
            showSafari = true
        } label: {
            HStack {
                Image(systemName: "link")
                Text(title)
            }
            .foregroundColor(.blue)
        }
    }
}

#Preview {
    LaunchDetailView(launch: Launches(id: "5eb87cd9ffd86e000604b32a", name: "FalconSat", details: "Engine failure at 33 seconds and loss of vehicle", rocket: "5e9d0d95eda69955f709d1eb", success: false, dateLocal: "2006-03-25T10:30:00+12:00", links: Links(patch: Patch(small: "", large: "https://images2.imgbox.com/5b/02/QcxHUb5V_o.png"), article: "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html", wikipedia: "https://en.wikipedia.org/wiki/DemoSat")))
}
