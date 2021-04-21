//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UILabel {

    /// (set only) bind a stream to font
    var font: SignalProducer<UIFont, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.font] <~ newValue.take(duringLifetimeOf: base), for: "font")
        }
    }

    /// (set only) bind a stream to textColor
    var textColor: SignalProducer<UIColor, Never> {
        get { return .empty }
        set {
            hold(base.reactive.textColor <~ newValue.take(duringLifetimeOf: base), for: "textColor")
        }
    }

    /// (set only) bind a stream to highlightedTextColor
    var highlightedTextColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.highlightedTextColor] <~ newValue.take(duringLifetimeOf: base), for: "highlightedTextColor")
        }
    }

    /// (set only) bind a stream to shadowColor
    var shadowColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.shadowColor] <~ newValue.take(duringLifetimeOf: base), for: "shadowColor")
        }
    }

}
#endif
