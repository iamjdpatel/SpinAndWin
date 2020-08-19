//
//  SpinAndWinApp.swift
//  SpinOnWatch Extension
//
//  Created by JD on 19/08/20.
//

import SwiftUI

@main
struct SpinAndWinApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
