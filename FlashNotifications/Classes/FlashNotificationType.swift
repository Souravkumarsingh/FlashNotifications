//
//  FlashNotificationType.swift
//  FlashNotifications
//
//  Created by Sourav Singh on 23/02/2026.
//  LICENSE : MIT
//

import Foundation
import UIKit

/** Protocol for defining a FlashNotification style **/
public protocol FlashNotificationType: Sendable {
    var textColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var image: UIImage? { get }
}
