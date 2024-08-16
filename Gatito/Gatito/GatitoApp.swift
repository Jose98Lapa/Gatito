//
//  GatitoApp.swift
//  Gatito
//
//  Created by José Miguel Lapa on 11/08/2024.
//

import SwiftUI
import Toast

@main
struct GatitoApp: App {
    
    let persistenceController = PersistenceController.shared
    @ObservedObject var connectionHelper = ConnectionHelper()
    
    let toast = Toast.default(
        image: UIImage(systemName: "exclamationmark.triangle")!,
        title: "Internet unavailable",
        config: ToastConfiguration(dismissBy: [.tap, .time(time: 10.0)])
    )
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: connectionHelper.isNetworkAccessible) { _, isNowConnected in
            if !isNowConnected { toast.show(haptic: .warning) }
        }
    }
}


