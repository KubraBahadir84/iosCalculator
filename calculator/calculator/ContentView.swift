//
//  ContentView.swift
//  calculator
//
//  Created by Kübra Bahadır on 6.02.2024.
//

import SwiftUI

// Hesap makinesi düğme tiplerini temsil eden enum
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
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = ","
    case percent = "%"
    case negative = "-/+"
    
    // Düğme gruplarının tipleri
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .purple
        case .clear, .negative, .percent:
            return Color(UIColor(red: 200/255.0, green: 162/255.0, blue: 200/255.0, alpha: 1))
        default:
            return Color(UIColor(red: 68/255.0, green: 43/255.0, blue: 99/255.0, alpha: 1))
        }
    }
}

// İşlemleri temsil eden enumlar
enum Operation {
    case add, subtract, multiply, divide, none
}

struct ContentView: View {
    
    // Buraya biraz daha detaylı bakılacak
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    // Düğme düzenleri
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack{
            Color(red: 230/255.0, green: 215/255.0, blue: 255/255.0).edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Metin görüntüleme
                HStack {
                    Spacer()
                    Text (value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                
                // Hesap makinesi düğmeleri
                ForEach(buttons,id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
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
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    // Bu bölümde eksiklikler var
    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self .runningNumber = Int(self.value) ?? 0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(runningValue +  currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            
            if button != .equal {
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        case .decimal, .negative, .percent:
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
    
    // Düğme genişlikleri
    func buttonWidth(item:CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12)) / 2)
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    // Düğme yükseklikleri
    func buttonHeight() -> CGFloat{
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

struct ContenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
