//
//  FlashNotifications.swift
//  FlashNotifications
//
//  Created by Sourav Singh on 23/02/2026.
//  LICENSE : MIT
//

import UIKit

public protocol FlashNotificationDelegate: Sendable {
    func onNotificationTap(type: FlashNotificationType, title: String?, message: String?)
}

public final class FlashNotificationManager {
    
    // MARK: - Static notification types
    
    public static let success: FlashNotificationType = FlashNotificationTypeDefinition(textColor: UIColor.white, backgroundColor: UIColor.flatGreen, image: UIImage(named: "success", in: Bundle(for: FlashNotificationManager.self), compatibleWith: nil))
    public static let error: FlashNotificationType = FlashNotificationTypeDefinition(textColor: UIColor.white, backgroundColor: UIColor.flatRed, image: UIImage(named: "error", in: Bundle(for: FlashNotificationManager.self), compatibleWith: nil))
    public static let info: FlashNotificationType = FlashNotificationTypeDefinition(textColor: UIColor.white, backgroundColor: UIColor.flatGray, image: UIImage(named: "info", in: Bundle(for: FlashNotificationManager.self), compatibleWith: nil))

    
    // MARK: - Init
    
    public init(){}
    
    
    // MARK: - Helpers
    
    /** Shows a FlashNotification.
        Returns the FlashNotification that is displayed. Returns nil if the keyWindow is not present.
     **/
    @discardableResult
    public static func showNotification(textColor: UIColor, backgroundColor: UIColor, image: UIImage?, title: String, message: String, dismissDelay: TimeInterval, delegate: FlashNotificationDelegate? = nil, completion: @escaping () -> Void = {}) -> FlashNotification? {
        let notificationDefinition = FlashNotificationTypeDefinition(textColor: textColor, backgroundColor: backgroundColor, image: image)
        return showNotification(type: notificationDefinition, title: title, message: message, dismissDelay: dismissDelay, delegate: delegate, completion: completion)
    }
    
    /** Shows a FlashNotification from a FlashNotificationType.
        Returns the FlashNotification that is displayed. Returns nil if the keyWindow is not present.
     **/
    @discardableResult
    public static func showNotification(type: FlashNotificationType, title: String, message: String, dismissDelay: TimeInterval, delegate: FlashNotificationDelegate? = nil, completion: @escaping () -> Void = {}) -> FlashNotification? {
        return MainActor.assumeIsolated {
            let view = FlashNotificationView(type: type)
            
            view.setTitle(title: title)
            view.setMessage(message: message)
            view.setDismisTimer(delay: dismissDelay)
            view.setCompletionBlock(completion)
            view.delegate = delegate
            
            guard let window = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .flatMap({ $0.windows })
                .first(where: { $0.isKeyWindow }) else {
                print("Failed to show FlashNotification. No keywindow available.")
                return nil
            }
            
            window.addSubview(view)
            view.showNotification()
            
            return view
        }
    }
}

fileprivate struct FlashNotificationTypeDefinition: FlashNotificationType {
    var textColor: UIColor
    var backgroundColor: UIColor
    var image: UIImage?
}
