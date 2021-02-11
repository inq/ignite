//
//  igniteApp.swift
//  ignite
//
//  Created by inkyu on 2021/01/21.
//

import SwiftUI

@main
struct IgniteApp: App {
  let persistenceController = PersistenceController.shared

  var body: some Scene {
    WindowGroup {
      MainView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
