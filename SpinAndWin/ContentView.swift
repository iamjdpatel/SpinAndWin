//
//  ContentView.swift
//  SpinAndWin
//
//  Created by JD on 19/08/20.
//

import SwiftUI

struct ContentView: View {
    @State var angle: Double = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                SpinWheel()
                    .rotationEffect(.degrees(angle))
                Image(systemName: "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 40, height: 60)
                    .foregroundColor(Color(UIColor.white))
                    .offset(y: -30)
                Text("Spin")
                    .font(.system(size: 22))
                    .bold()
                    .padding()
                    .frame(width: 80, height: 80)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(40)
                    .onTapGesture {
                        spin()
                    }
            }.edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Spin and Win", displayMode: .inline)
        }
    }
    
    private func spin() {
        //Calculate your number that how many times you want to spin the wheel
        let spinCount: Int = [30, 35, 40, 45, 50, 55, 60].randomElement() ?? 45
        
        withAnimation(.easeInOut(duration: 2)) {
            for _ in 0..<spinCount {
                angle += 60
            }
        }
    }
}

struct SpinWheel: View {
    var body: some View {
        ForEach(0..<6) { i in
            DrawShape(i: i)
        }
    }
}

struct DrawShape: View {
    var i: Int
    let centerX = UIScreen.main.bounds.width / 2
    let centerY = UIScreen.main.bounds.height / 2
    let colors: [Color] = [.red, .purple, .orange, .blue, .pink, .green]
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: centerX, y: centerY))
                path.addArc(center: CGPoint(x: centerX, y: centerY),
                            radius: 160,
                            startAngle: .init(degrees: Double(60 * i)),
                            endAngle: .init(degrees: Double(60 * i) + 60),
                            clockwise: false)
            }
            .fill(colors[i])
            VStack {
                Text("$\((i + 1) * 250)")
                    .font(.title3)
                    .bold()
                    .frame(height: 270, alignment: .top)
                    .rotationEffect(.degrees(Double(60 * i) + 30 + 90))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


