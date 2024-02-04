//
//  ContentView.swift
//  calculator
//
//  Created by Kübra Bahadır on 9.01.2024.
//

import SwiftUI

enum CalcButton:String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case mutliply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = ","
    case percent = "%"
    case negative = "-/+"
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent],
        [.seven, .eight, .nine],
        [.four, .five, .six],
        [.one, .two, .three],
        [.zero, .zero, .decimal]
    ]
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                // Text display
                HStack {
                    Spacer()
                    Text ("0")
                        .bold()
                        .font(.system(size: 64))
                        .foregroundColor(.white)
                }
                .padding()
            
                // Anlamadik Usta
                ForEach(buttons,id: \.self) { row in
                    HStack {
    ForEach(row, id: \.self) { item in
    Button(action: {
    }, label: {
        Text(item.rawValue)
            .font(.system(size: 32))
            .frame(width: 70, height: 70)
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(35)
    })
                    }
                }
            }
        }
    }
}
}
/*struct ContenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView
  */
    
