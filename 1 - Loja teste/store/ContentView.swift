//
//  ContentView.swift
//  store
//
//  Created by Rodrigo Torres on 23/06/22.
//

import SwiftUI

struct ContentView: View {
    @State var mainColor = Color(red: 70/255, green: 28/255, blue: 58/255)
  var body: some View {
      
    NavigationView {
        ZStack{
            mainColor.ignoresSafeArea()
                .opacity(0.80)
    
      VStack {
          
          Rectangle()
                .frame(height: 0)
                 .background(Color.green.opacity(0.2))
                Text("Escolha os produtos para colocar no carrinho")
              .padding()
              .multilineTextAlignment(.center)

        Spacer()
        NavigationLink(
          destination: ItemDetailView(itemName: "Energetico Monster"),
          label: {
            Text("Energetico Monster")
                  .font(.largeTitle)
          })
        Spacer()
      }
      // Sets a navigation title of "Ligaya's Store"
      .navigationTitle(Text("Loja do Rodrigo"))
      // Sets the styling of the navigation title to inline
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}
}
struct ItemDetailView: View {
  @State var quantityRemaining = Int.random(in: 1...10)
  let itemName: String
 
  var body: some View {
    VStack {
      Text("\(itemName)")
        .font(.title)
        .padding()
      Spacer()
      Image(systemName: "photo")
        .font(.system(size: 200))
        .padding()
      Text("Quantity Remaining: \(quantityRemaining)")
      Spacer()
      Button {
        if quantityRemaining > 0 {
          quantityRemaining -= 1
        }
      } label: {
        Text("Adicione no seu carrinho")
      }
      Spacer()
    }
    // .background() runs the view below in the background
    .background(
      // The navigation link is not active until the quantity is 0
      NavigationLink(destination: Text("Você comprou todos os \(itemName)!"),
                     isActive: .constant(quantityRemaining == 0),
                     label: { EmptyView() })
    )
  }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
