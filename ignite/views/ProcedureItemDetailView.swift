//
//  ProceduresItemDetailView.swift
//  ignite
//
//  Created by inkyu on 2021/02/11.
//

import CoreData
import SwiftUI

struct ProcedureItemDetailView: View {
  @State var procedure: Procedure
  @Binding var showing: Bool

  var body: some View {
    NavigationView {
      VStack {
        Text(procedure.title != nil ? procedure.title! : "TITLE")
        Text("Hihi")
      }
      .background(Color.white)
      .navigationBarTitle(Text(procedure.title!), displayMode: .inline)
      .navigationBarItems(
        trailing: Button(action: { showing = false }) { Text("Done").bold() })
    }
  }
}

struct ProcedureItemDetailView_Previews: PreviewProvider {
  @State var showingDetail = true
  static var previews: some View {
    ProcedureItemDetailView(procedure: Procedure(), showing: Binding.constant(true))
  }
}
