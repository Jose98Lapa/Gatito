//
//  ConnectionHelper.swift
//  Gatito
//
//  Created by José Miguel Lapa on 12/08/2024.
//

import Foundation
import SystemConfiguration
import WebKit

class ConnectionHelper: ObservableObject {
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue.global(qos: .background)
    @Published var isNetworkAccessible: Bool = false
    
    init() {
        setupPathHandler()
    }
    
    func setupPathHandler() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isNetworkAccessible = path.status == .satisfied
        }
    }
}
