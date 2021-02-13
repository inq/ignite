//
//  ProceduresView.swift
//  ignite
//
//  Created by inkyu on 2021/01/21.
//

import CoreData
import SwiftUI

struct ProceduresView: View {
  @State var isPresented = false

  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Procedure.createdAt, ascending: false)],
    animation: .default)

  private var items: FetchedResults<Procedure>

  var body: some View {
    NavigationView {
      List {
        ForEach(items) { item in
          ProcedureItemView(procedure: item)
        }
      }
      .sheet(isPresented: $isPresented) {
        NewProcedureItemView(showing: $isPresented) { title in
          self.addItem(title: title)
          self.isPresented = false
        }
      }
      .navigationBarItems(
        leading:
          HStack {
            Image(systemName: "gear")
            Text("PROCEDURES")
          },
        trailing:
          Button(action: { self.isPresented.toggle() }) {
            Image(systemName: "plus")
          }
      )
    }
  }

  private func addItem(title: String) {
    withAnimation {
      let newItem = Procedure(context: viewContext)
      newItem.createdAt = Date()
      newItem.uuid = UUID()
      newItem.title = title

      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(viewContext.delete)

      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

struct ProceduresView_Previews: PreviewProvider {
  static var previews: some View {
    ProceduresView().environment(
      \.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
