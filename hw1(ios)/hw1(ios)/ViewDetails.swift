//
//  ViewDetails.swift
//  hw1(ios)
//
//  Created by Dariya Zhaxylykova on 02.06.2025.
//
import SwiftUI

struct ViewDetails: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 30) {
            Text("About Me!!")
                .font(.largeTitle)
                .bold()

            Image("myPhoto")
                .resizable()
                .clipShape(Circle())
                .frame(width: 300, height: 300)
                .shadow(radius: 10)
            
                Text("""
            Hi! My name is Dariya. I am 19 yo. I started coding back in high school, first out of curiosity, and then it became something I truly enjoy. I love reading detective books and emotional fiction, also comics(especially dc!). Music is a big part of my life — my favourite music band is *the Neighbourhood*. My favourite tv-show is *Supernatural* and fav book is "Frankenstein" by Mary Shelley.
            """)
                .frame(height: 250)
                .multilineTextAlignment(.center)
                .padding()
            
            .foregroundColor(Color(red: 236/255, green: 141/255, blue: 179/255))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 236/255, green: 141/255, blue: 179/255), lineWidth: 1)
            )
            Button("Go Back"){
                dismiss()
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 236/255, green: 141/255, blue: 179/255))
            .cornerRadius(12)
            .padding(.horizontal)
        }
        .padding()
    }
}
