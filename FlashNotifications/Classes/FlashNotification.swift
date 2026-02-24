//
//  FlashNotifications.swift
//  FlashNotifications
//
//  Created by Sourav Singh on 23/02/2026.
//  LICENSE : MIT
//

import UIKit

public protocol FlashNotification: Sendable {
    func hide()
}

@MainActor
public final class FlashNotificationView: UIView, FlashNotification {
    
    private let topBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 14
        return stack
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let textStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 2
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
        }
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor.lightGray : UIColor.darkGray
        }
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
	}()
	
    private var completion: () -> Void = {}
    private var type: FlashNotificationType
    public var delegate: (any FlashNotificationDelegate)?
    
    // MARK: - Init
	
    required internal init?(coder aDecoder:NSCoder) { fatalError("Not implemented.") }
    
    internal init(type: FlashNotificationType) {
        let deviceWidth = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        let widthFactor: CGFloat = DeviceManager.value(iPhone35: 0.92, iPhone40: 0.92, iPhone47: 0.92, iPhone55: 0.90, iPhone58: 0.92, iPhone61: 0.92, iPadSmall: 0.65, iPadMedium: 0.60, iPadBig: 0.50)
        let heightFactor: CGFloat = DeviceManager.value(iPhone35: 0.20, iPhone40: 0.20, iPhone47: 0.18, iPhone55: 0.18, iPhone58: 0.17, iPhone61: 0.17, iPadSmall: 0.16, iPadMedium: 0.15, iPadBig: 0.14)

        let width = deviceWidth * widthFactor
        let height = width * heightFactor
        self.type = type
        
        super.init(frame: CGRect(x: 0, y: -height, width: width, height: height))
        center.x = UIScreen.main.bounds.width/2
        setupLayer()
        setupSubviews()
        setupConstraints()
        setupTargets()
        
        // setup type attributes
        self.setAccentColor(color: type.backgroundColor)
        self.setImage(image: type.image)
    }
    
    
    // MARK: - Setup
    
    private func setupLayer() {
        backgroundColor = UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor.systemGray5 : UIColor.white
        }
        layer.cornerRadius = 12
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 6)
        clipsToBounds = false
    }
    
    private func setupSubviews() {
        addSubview(topBar)
        addSubview(contentStack)
        
        contentStack.addArrangedSubview(iconContainer)
        iconContainer.addSubview(imageView)
        contentStack.addArrangedSubview(textStack)
        
        textStack.addArrangedSubview(titleLabel)
        textStack.addArrangedSubview(messageLabel)
    }
    
    private func setupConstraints() {
        // Top accent bar
        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: topAnchor),
            topBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBar.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        // Content stack
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: topBar.bottomAnchor, constant: 6),
            contentStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6)
        ])
        
        // Icon container
        NSLayoutConstraint.activate([
            iconContainer.widthAnchor.constraint(equalToConstant: 40),
            iconContainer.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Image inside icon
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: iconContainer.topAnchor, constant: 6),
            imageView.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor, constant: 6),
            imageView.trailingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: -6),
            imageView.bottomAnchor.constraint(equalTo: iconContainer.bottomAnchor, constant: -6)
        ])
        
        // Text stack
        NSLayoutConstraint.activate([
            textStack.trailingAnchor.constraint(lessThanOrEqualTo: contentStack.trailingAnchor)
        ])
    }
    
    private func setupTargets() {
        NotificationCenter.default.addObserver(self, selector: #selector(didRotate), name: UIDevice.orientationDidChangeNotification, object: nil)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissNotificationOnTap))
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.dismissNotification))
        swipeRecognizer.direction = .up
        
        addGestureRecognizer(tapRecognizer)
        addGestureRecognizer(swipeRecognizer)
	}
    
    
    // MARK: - Helpers
    
    @objc internal func didRotate() {
        UIView.animate(withDuration: 0.2) {
            self.center.x = UIScreen.main.bounds.width / 2
            self.center.y = self.topInset() + 12 + self.frame.height / 2
        }
    }
    
    /** Sets the accent bar color **/
    internal func setAccentColor(color: UIColor) {
        topBar.backgroundColor = color
        iconContainer.backgroundColor = color.withAlphaComponent(0.15)
    }
    
    /** Sets the title of the notification **/
    internal func setTitle(title: String) {
        titleLabel.text = title
    }
    
    /** Sets the message of the notification **/
    internal func setMessage(message: String) {
        messageLabel.text = message
    }
    
    /** Sets the image of the notification **/
    internal func setImage(image: UIImage?) {
        if let image = image {
            imageView.image = image
            imageView.tintColor = type.backgroundColor
        }
    }
    
    /** Sets the completion block of the notification for when it is dismissed **/
    internal func setCompletionBlock(_ completion: @escaping () -> Void) {
        self.completion = completion
    }
    
    /** Dismisses the notification with a delay > 0 **/
    internal func setDismisTimer(delay: TimeInterval) {
        if delay > 0 {
            Timer.scheduledTimer(timeInterval: Double(delay), target: self, selector: #selector(dismissNotification), userInfo: nil, repeats: false)
        }
    }
    
    /** Animates in the notification **/
    internal func showNotification() {
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.15, options: .curveEaseOut, animations: {
            self.frame.origin.y = self.topInset() + 12
        })
    }
    
    @objc internal func dismissNotificationOnTap() {
        delegate?.onNotificationTap(type: type, title: titleLabel.text, message: messageLabel.text)
        self.dismissNotification()
    }
    
    /** Animates out the notification **/
    @objc internal func dismissNotification() {
        hide()
    }
    
    private func topInset() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            statusBarHeight = windowScene.statusBarManager?.statusBarFrame.height ?? 0
        }
        
        let iPhoneXInset: CGFloat = statusBarHeight == 0 ? 44 : statusBarHeight
        return DeviceManager.value(iPhoneX: iPhoneXInset, other: statusBarHeight)
    }
    
    
    // MARK: - Public
    
    public func hide() {
        UIView.animate(withDuration: 0.2, animations: {
            self.frame.origin.y = -self.frame.height - 10
            self.alpha = 0.5
        }, completion: { [weak self] _ in
            self?.removeFromSuperview()
            self?.completion()
        })
    }
    
}
