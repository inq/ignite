//
//  ProceduresView.swift
//  ignite
//
//  Created by inkyu on 2021/02/07.
//

import CoreData
import SwiftUI

struct ProcedureItemView: View {
  @State var procedure: Procedure
  @State private var showingDetail = false

  var body: some View {
    Button(action: { showingDetail.toggle() }) {
      VStack {
        Text(procedure.title!).frame(maxWidth: .infinity, alignment: .leading)
        Text(itemFormatter.string(from: procedure.createdAt!)).font(.system(size: 10)).frame(
          maxWidth: .infinity, alignment: .trailing)
      }
      .background(Color.white)
    }.sheet(isPresented: $showingDetail) {
      ProcedureItemDetailView(procedure: procedure, showing: $showingDetail)
    }
  }
}

private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

struct ProcedureItemView_Previews: PreviewProvider {
  static var previews: some View {
    ProcedureItemView(procedure: Procedure())
  }
}
