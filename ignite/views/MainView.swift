//
//  MainView.swift
//  ignite
//
//  Created by inkyu on 2021/01/21.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      MemorizeView(procedure: nil)
        .tabItem {
          Image(systemName: "pencil.and.ellipsis.rectangle")
          Text("Memorize")
        }
      ProceduresView()
        .tabItem {
          Image(systemName: "text.bubble")
          Text("Procedures")
        }
      ProceduresView()
        .tabItem {
          Image(systemName: "chart.bar.fill")
          Text("Stats")
        }
      ProceduresView()
        .tabItem {
          Image(systemName: "gear")
          Text("Settings")
        }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
