//
//  InfoBox.swift
//  hw1(ios)
//
//  Created by Dariya Zhaxylykova on 02.06.2025.
//
import SwiftUI
struct InfoBox: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(Color(red: 236/255, green: 141/255, blue: 179/255))
                .foregroundStyle(.tint)
            Text(title)
                .font(.title2)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
        }
    }
}
