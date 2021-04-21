//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)


import QuartzCore
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: CALayer {

    /// (set only) bind a stream to backgroundColor
    var backgroundColor: SignalProducer<CGColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.backgroundColor] <~ newValue.take(duringLifetimeOf: base), for: "backgroundColor")
        }
    }

    /// (set only) bind a stream to borderWidth
    var borderWidth: SignalProducer<CGFloat, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.borderWidth] <~ newValue.take(duringLifetimeOf: base), for: "borderWidth")
        }
    }

    /// (set only) bind a stream to borderColor
    var borderColor: SignalProducer<CGColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.borderColor] <~ newValue.take(duringLifetimeOf: base), for: "borderColor")
        }
    }

    /// (set only) bind a stream to shadowColor
    var shadowColor: SignalProducer<CGColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.shadowColor] <~ newValue.take(duringLifetimeOf: base), for: "shadowColor")
        }
    }

}
#endif
