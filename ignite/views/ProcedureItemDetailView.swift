//
//  ProceduresItemDetailView.swift
//  ignite
//
//  Created by inkyu on 2021/02/11.
//

import Combine
import CoreData
import SwiftUI

struct StepView: View {
  @State var step: Step

  var body: some View {
    HStack {

    }
  }
}

struct ProcedureItemDetailView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @ObservedObject var procedure: Procedure

  @Binding var showing: Bool

  @FetchRequest var steps: FetchedResults<Step>

  @State var content: String = ""
  @State var action: String = ""
  @State var ordinal: String = ""

  init(procedure: Procedure, showing: Binding<Bool>) {
    self.procedure = procedure
    self._showing = showing

    self._steps = FetchRequest(
      entity: Step.entity(),
      sortDescriptors: [],
      predicate: NSPredicate(format: "procedure = %@", procedure)
    )

  }

  var body: some View {
    NavigationView {
      VStack {
        HStack {
          TextField("Ordinal", text: $ordinal).keyboardType(.numberPad)
            .onReceive(Just(ordinal)) { newValue in
              let filtered = newValue.filter { "0123456789".contains($0) }
              if filtered != newValue {
                self.ordinal = filtered
              }
            }
          TextField("Content", text: $content)
          TextField("Action", text: $action)
          Button(action: {
            let step = Step(context: procedure.managedObjectContext!)
            step.procedure = procedure
            step.action = action
            step.ordinal = Int32(ordinal)!
            step.content = content

          }) {
            Text("Add")
          }
        }
        List {
          ForEach(steps) { step in
            Text((step as Step).content!)
          }
          .onDelete(perform: { offsets in
            for index in offsets {
              viewContext.delete(steps[index])
            }
          })
        }
      }
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
