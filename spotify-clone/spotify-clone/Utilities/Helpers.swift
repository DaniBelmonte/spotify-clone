//
//  Helpers.swift
//  spotify-clone
//
//  Created by Dani on 10/6/23.
//

import Foundation
import SwiftUI

// MARK: - Alert

/// Function to show a quick alert.
func showAlert(title: String, message: String) {
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let rootViewController = windowScene.windows.first?.rootViewController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        rootViewController.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Unique ID

/// Generates a unique ID.
func generateUniqueID() -> String {
    let timestamp = Date().timeIntervalSince1970
    return "\(timestamp)"
}
