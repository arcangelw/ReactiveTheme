////
////  UIButton+Theme.swift
////  Pods
////
//  Created by duan on 2019/01/23.
//

#if os(iOS) || os(tvOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa

public extension Reactive where Base: UIButton {

    /// Bindable sink for `titleColor` property
    func titleColor(for state: UIControl.State) -> BindingTarget<UIColor?> {
        return makeBindingTarget {
            $0.setTitleColor($1, for: state)
        }
    }

}

public extension ThemeProxy where Base: UIButton {

    func titleColor(from stream: SignalProducer<UIColor?, Never>, for state: UIControl.State) {
        hold(base.reactive.titleColor(for: state) <~ stream.take(duringLifetimeOf: base), for: "titleColor.forState.\(state.rawValue)")
    }

}
#endif
