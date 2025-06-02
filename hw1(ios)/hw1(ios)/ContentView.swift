//
//  ContentView.swift
//  hw1(ios)
//
//  Created by Dariya Zhaxylykova on 02.06.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Text("Hello!")
                    .font(.title)
                    .bold()
                HStack {
                    Text("My name is Dariya")
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .foregroundColor(Color(red: 236/255, green: 141/255, blue: 179/255))
                        .foregroundStyle(.tint)
                }
                Image("myPhoto")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                
                    
                
                HStack(spacing: 20) {
                    InfoBox(icon: "globe.asia.australia", title: "Location", value: "Almaty")
                    InfoBox(icon: "calendar.and.person", title: "Age", value: "19")
                    InfoBox(icon: "moon.zzz", title: "Favcolor", value: "purple")
                    
                    
                }
                NavigationLink(destination: ViewDetails()) {
                    Text("View details")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 236/255, green: 141/255, blue: 179/255))
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
