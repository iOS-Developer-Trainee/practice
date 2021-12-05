//
//  ContentView.swift
//  Memorize
//
//  Created by 오승기 on 2021/12/05.
//

import SwiftUI

//View는 우리가 만들고있는 구조체가 view처럼 동작한다는 것을 의미한다
//함수형프로ㅗ그래밍에서는 사물의 동작방식
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
