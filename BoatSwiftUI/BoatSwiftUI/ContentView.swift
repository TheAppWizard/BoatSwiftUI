//
//  ContentView.swift
//  BoatSwiftUI
//
//MARK:  Created by Shreyas Vilaschandra Bhike on 21/06/21.
//MARK:  The App Wizard
//MARK:  Instagram : theappwizard2408


import SwiftUI

struct ContentView: View {
    var body: some View {
        FinalView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
























struct FinalView: View {
    @State var boatanimate  = false
    @State  var waveanimate  = false
    
    var body: some View {
        ZStack{
            BeachView()
            
            
            
           //            Wave Animation
            ZStack{
            Circle()
                .foregroundColor(.clear)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .opacity(waveanimate ? 1 : 0.5)
                .scaleEffect(waveanimate ? 1 : 0.2)

           Circle()
            .foregroundColor(.clear)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .opacity(waveanimate ? 0.7 : 0.5)
            .scaleEffect(waveanimate ? 0.7 : 0.5)


            }.animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: false))
            .onAppear() {
                self.waveanimate.toggle()
                    }
            
            
            BoatView()
                .offset(x: 0, y: boatanimate ? 10 : 7)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.boatanimate.toggle()
                        }
            
            ZStack{
            Image("explore")
                .resizable()
                .opacity(1)
                .shadow(color: .black, radius: 1, x: 0, y: 10)
                .offset(x: 0, y: -290)
                .frame(width: 420, height: 175, alignment: .center)
                
            }.padding()
            
            
        }
        
    }
}



struct BeachView: View {
    
    
    var body: some View {
        
        ZStack{
           
            Color("water").edgesIgnoringSafeArea(.all)
            Image("beach").resizable().edgesIgnoringSafeArea(.all)
        }
    }
}


// MARK: Boat

struct BoatView: View {
  
    var body: some View {
        ZStack{
            
            Image("boatm")
                .resizable()
                .frame(width: 450, height: 450, alignment: .center)
                .shadow(color: .black, radius: 10, x: 20, y: 0.0)
            
            Arms().offset(x: 0, y: -5)
           
            
        }
     
    }
}

// MARK: Arms Section

//To hold Arms
struct Arms: View {

    
    var body: some View {
        Left().offset(x: 1, y: 1.5)
        Right().offset(x: -1, y: -1.5)
    }
}


//Left Arm
struct Left: View {
    @State var left  = false
    
    var body: some View {
        ZStack{
            
            Image("leftm")
                .resizable()
                .frame(width: 450, height: 450, alignment: .center)
            
                .rotationEffect(.degrees(left ? 15 : -10))
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                .onAppear() {
                    self.left.toggle()
                        }
            
        }
    }
}

//Right Arm
struct Right: View {
    @State var right  = false
    
    var body: some View {
        ZStack{
            
            Image("rightm")
                .resizable()
                .frame(width: 450, height: 450, alignment: .center)
            
                .rotationEffect(.degrees(right ? -10 : 15))
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                .onAppear() {
                    self.right.toggle()
                        }
            
        }
    }
}
