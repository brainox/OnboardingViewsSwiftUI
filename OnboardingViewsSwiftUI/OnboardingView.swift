//
//  OnboardingView.swift
//  OnboardingViewsSwiftUI
//
//  Created by Decagon on 09/10/2021.
//

import SwiftUI

struct OnboardingView: View {
    // Onboarding states:
    /*
     0 - Welcome Screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    
    @State var onboardingState: Int = 0
    
    var body: some View {
        ZStack {
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                }
            }
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(Color.purple)
    }
}


extension OnboardingView {
    private var bottomButton: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
    //                    .onTapGesture {
    //                        <#code#>
    //                    }
    }
    
    
    private var welcomeSection: some View {
        VStack {
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
}
