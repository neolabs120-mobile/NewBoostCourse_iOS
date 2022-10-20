//
//  NewBoostCourseApp.swift
//  NewBoostCourse
//
//  Created by kimtaeuk on 2022/06/20.
//

import SwiftUI

@main
struct NewBoostCourseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SwiftUiView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
