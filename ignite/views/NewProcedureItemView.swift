//
//  ProceduresItemNewView.swift
//  ignite
//
//  Created by inkyu on 2021/02/07.
//

import SwiftUI

struct NewProcedureItemView: View {
  @State var title = ""
  @Binding var showing: Bool

  let onComplete: (String) -> Void

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Title")) {
          TextField("Title", text: $title)
        }
      }
      .navigationBarTitle(Text("New Procedure"), displayMode: .inline)
      .navigationBarItems(
        leading: Button(action: { showing = false }) { Text("Dismiss").bold() },
        trailing: Button(action: createItem) { Text("Done").bold() })
    }
  }

  private func createItem() {
    onComplete(
      title
    )
  }
}

struct NewProcedureItemView_Previews: PreviewProvider {
  static var previews: some View {
    NewProcedureItemView(showing: Binding.constant(true), onComplete: { _ in })
  }
}
