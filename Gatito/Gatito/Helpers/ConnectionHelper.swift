//
//  ConnectionHelper.swift
//  Gatito
//
//  Created by José Miguel Lapa on 12/08/2024.
//

import Foundation
import Network

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
        
        monitor.start(queue: queue)
    }
}
