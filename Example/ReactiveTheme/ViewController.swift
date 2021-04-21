//
//  ViewController.swift
//  ReactiveTheme
//
//  Created by arcangelw on 04/21/2021.
//  Copyright (c) 2021 arcangelw. All rights reserved.
//

import UIKit
import ReactiveTheme
import ReactiveCocoa
import ReactiveSwift

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
    typealias Color = UIColor
#endif
#if os(macOS)
    import Cocoa
    typealias Color = NSColor
#endif


protocol Theme {
    var backgroundColor: Color { get }
    var textColor: Color { get }
    var borderWidth: CGFloat { get }
    var borderColor: Color { get }
}

struct LightTheme: Theme {
    let backgroundColor = Color.white
    let textColor = Color.black
    let borderWidth: CGFloat = 1.0
    let borderColor: Color = Color.green
}

struct DarkTheme: Theme {
    let backgroundColor = Color.black
    let textColor = Color.white
    let borderWidth: CGFloat = 2.0
    let borderColor: Color = Color.yellow
}

enum ThemeType: ThemeProvider {
    case light, dark
    var associatedObject: Theme {
        switch self {
        case .light: return LightTheme()
        case .dark: return DarkTheme()
        }
    }
}
let themeService = ThemeType.service(initial: .light)
func themed<T>(_ mapper: @escaping ((Theme) -> T)) -> SignalProducer<T, Never> {
    return themeService.attrStream(mapper)
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "Tap to switch theme"
        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        view.theme.backgroundColor = themed { $0.backgroundColor }
        label.theme.textColor = themed { $0.textColor }
        label.layer.theme.borderWidth = themed { $0.borderWidth }
        label.layer.theme.borderColor = themed { $0.borderColor.cgColor }

        let button = UIButton()
        button.adjustsImageWhenHighlighted = false
        button.setTitle("presentOrDismiss", for: .normal)
        button.addTarget(self, action: #selector(presentOrDismiss), for: .touchUpInside)
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20.0)
        ])

        button.theme.backgroundColor = themed { $0.backgroundColor }
        button.theme.titleColor(from: themed { $0.textColor }, for: .normal)
        button.layer.theme.borderWidth = themed { $0.borderWidth }
        button.layer.theme.borderColor = themed { $0.borderColor.cgColor }

        let tapGesture = UITapGestureRecognizer()
        view.addGestureRecognizer(tapGesture)
        themeService.switcher <~ tapGesture.reactive.stateChanged
            .take(duringLifetimeOf: self)
            .withLatest(from: themeService.typeStream)
            .map { $1 == .dark ? .light : .dark }
    }

    @objc private func presentOrDismiss() {
        if presentingViewController != .none {
            dismiss(animated: true)
        } else {
            let vc = ViewController()
            present(vc, animated: true)
        }
    }
}

