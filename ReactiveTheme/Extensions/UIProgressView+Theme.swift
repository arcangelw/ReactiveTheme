//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UIProgressView {

    /// (set only) bind a stream to progressTintColor
    var progressTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.progressTintColor] <~ newValue.take(duringLifetimeOf: base), for: "progressTintColor")
        }
    }

    /// (set only) bind a stream to trackTintColor
    var trackTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.trackTintColor] <~ newValue.take(duringLifetimeOf: base), for: "trackTintColor")
        }
    }

}
#endif
