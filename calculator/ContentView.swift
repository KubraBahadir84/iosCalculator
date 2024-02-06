//
//  ContentView.swift
//  calculator
//
//  Created by Kübra Bahadır on 4.02.2024.
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
    
    var buttonColor: Color {
        switch self {
      case .add, .subtract, .mutliply, .divide, .equal:
           return .orange
       case .clear, .negative, .percent:
          return Color(.lightGray)
     default:
        
            
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
        
        enum Operation {
            case add, subtract, multiply, divide, none
        }
    

struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Text display
                HStack {
                    Spacer()
                    Text (value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
            
                // Anlamadik Usta
                ForEach(buttons,id: \.self) { row in
                    HStack(spacing: 12) {
    ForEach(row, id: \.self) { item in
    Button(action: {
        self.didTap(button: item)
    }, label: {
        Text(item.rawValue) //burda bi sikinti var
            .font(.system(size: 32))
            .frame(
                width: self.buttonWidth(item: item),
                height: self.buttonHeight()
            )
            .background(item.buttonColor)
            .foregroundColor(.white)
            .cornerRadius(self.buttonWidth(item: item)/2)
    })
                    }
                }
                    padding(.bottom, 3)
            }
        }
    }
}
    
    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            break
        case .clear:
            self.value = "0"
           break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func buttonWidth(item:CalcButton) -> CGFloat {
        if item == .zero {
            return (UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat{
        return (UIScreen.main.bounds.width - (5*12)) / 4
}
}
/*struct ContenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView
  */
    
