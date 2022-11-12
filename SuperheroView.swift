//
//  SuperheroView.swift
//  Superheros
//
//  Created by Tolba on 10/11/2022.
//

import SwiftUI

struct SuperheroView: View {
    var superHeroData : Superhero
    @State var isAlert: Bool = false
    @State var isScaling : Bool = false
    @State var isSliding : Bool = false
    
    var body: some View {
        ZStack {
            Image(superHeroData.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling ? 1 : 0.5)
                .animation(.easeInOut(duration: 2), value: isScaling)
            VStack{
                Text(superHeroData.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                Button {
                    isAlert.toggle()
                }
            label: {
                HStack{
                    Text("Start")
                    Image(systemName: "arrow.right.circle")
                } //: HStack
                .padding()
                .font(.title2)
                .foregroundColor(.white)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: superHeroData.gradientColors),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )).clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(
                        isPresented: $isAlert) {
                            Alert(
                                title: Text(superHeroData.title),
                                message: Text(superHeroData.message),
                                dismissButton: .default(Text("OK"))
                            ) //: Alert
                        } //: Alert
            }//: Lable
            } //: VStack
            .offset(y: isSliding ? 150: 300)
            .animation(.easeInOut(duration: 2), value: isSliding)
        } //: ZStack
        .frame(width: 335,height: 545,alignment: .center
        )
        .background(LinearGradient(
            gradient: Gradient(colors: superHeroData.gradientColors),
            startPoint: .bottomTrailing,
            endPoint: .topLeading)
        )
        .cornerRadius(22)
        .shadow(color: .black, radius: 2, x: 2,y: 2)
        .onAppear {
            isScaling = true
            isSliding = true
        }
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView(superHeroData: superherosData[0])
    }
}
