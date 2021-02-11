//
//  ContentView.swift
//  ignite
//
//  Created by inkyu on 2021/01/21.
//

import SwiftUI

struct MemorizeItemView: View {
  let number: Int
  let item: String

  var body: some View {
    HStack {
      Text(String(number))
        .font(.system(size: 8))
        .bold()
        .frame(
          width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/ .center /*@END_MENU_TOKEN@*/
        )
        .padding(0)
        .overlay(
          Circle()
            .stroke(Color.red, lineWidth: 2)
            .padding(0)
        )
      Text(item)
    }
  }
}

struct MemorizeView: View {
  let procedure: Procedure?

  var body: some View {
    VStack {
      HStack {
        Image(systemName: "pencil.and.ellipsis.rectangle")
        Text("BEFORE TAKEOFF CHECK")
          .font(.system(size: 20))
          .bold()
      }
      List {
        MemorizeItemView(number: 1, item: "Parking Brakes: SET")
        MemorizeItemView(number: 2, item: "Seat Back: ERECT")
        MemorizeItemView(number: 3, item: "Cabin Door: CLOSE & LOCKED")
        MemorizeItemView(number: 4, item: "Flight Control: FREE & CORRECT")
        MemorizeItemView(number: 5, item: "Flight Instruments")
        MemorizeItemView(number: 6, item: "ASI needle: ZERO")
        HStack {
          Text("")
            .font(.system(size: 8))
            .frame(
              width: 10, height: 10,
              alignment: /*@START_MENU_TOKEN@*/ .center /*@END_MENU_TOKEN@*/
            )
            .padding(0)
          Image(systemName: "forward.fill")
            .foregroundColor( /*@START_MENU_TOKEN@*/.blue /*@END_MENU_TOKEN@*/)

        }
        HStack {

        }
        HStack {
          Text("BLACKOUT")
            .font(.system(size: 10))
            .foregroundColor(Color.white)
            .frame(width: 70, height: 20, alignment: .center)
            .padding(2)
            .background(Color.red)
          Text("INCORRECT")
            .font(.system(size: 10))
            .foregroundColor(Color.white)
            .frame(width: 70, height: 20, alignment: .center)
            .padding(2)
            .background(Color.orange)
          Text("HESITATION")
            .font(.system(size: 10))
            .foregroundColor(Color.white)
            .frame(width: 70, height: 20, alignment: .center)
            .padding(2)
            .background(Color.green)
          Text("PERFECT")
            .font(.system(size: 10))
            .foregroundColor(Color.white)
            .frame(width: 70, height: 20, alignment: .center)
            .padding(2)
            .background(Color.blue)
        }
      }
    }
  }
}

struct MemorizeView_Previews: PreviewProvider {
  static var previews: some View {
    MemorizeView(procedure: nil)
  }
}
