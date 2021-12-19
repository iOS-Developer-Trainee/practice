//
//  ContentView.swift
//  Memorize
//
//  Created by 오승기 on 2021/12/05.
//

import SwiftUI


struct ContentView: View {
    @State var vehicleEmojis = ["🚅",  "🛬", "🚀", "🚤"," 🛳","⛴","🚢","🛰","💺","🛩","✈️","🚂","🚡","🚞","🚖","🚘","🛺","🏍","🚜","🚛"]
    var themeOneEmojis = ["🛬", "🚀","🛩","✈️","🛫","🚁","🛸","💺","🛰"]
    var themeTwoEmojis = ["🚅","🚂","🚡","🚞","🚠","🚟","🚄","🚝","🚈"]
    @State var vehicleEmojisCount = 15
    //function builder, group
    var body: some View {
        VStack {
            title
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(vehicleEmojis[0..<vehicleEmojisCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            HStack {
                Spacer()
                vehicle
                Spacer()
                themeOne
                Spacer()
                themeTwo
                Spacer()
            }
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var title: some View {
        Text("Memorize!")
            .padding()
            .font(.largeTitle)
    }
    
    var vehicle: some View {
        Button {
            vehicleEmojis = vehicleEmojis.shuffled()
//            if vehicleEmojisCount > 1 {
//                vehicleEmojisCount -= 1
//            }
        } label: {
            VStack {
                Image(systemName: "car.fill")
                Text("Vehicle").font(.body)
            }
        }
    }
    
    var themeOne: some View {
        Button {
            
        } label: {
            VStack {
                Image(systemName: "airplane.circle.fill")
                Text("Theme 1").font(.body)
            }
        }
    }
    
    var themeTwo: some View {
        Button {
            
        } label: {
            VStack {
                Image(systemName: "tram.circle.fill")
                Text("Theme 2").font(.body)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
