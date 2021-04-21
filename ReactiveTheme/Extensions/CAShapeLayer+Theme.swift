//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)


import QuartzCore
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: CAShapeLayer {

    /// (set only) bind a stream to strokeColor
    var strokeColor: SignalProducer<CGColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.strokeColor] <~ newValue.take(duringLifetimeOf: base), for: "strokeColor")
        }
    }

    /// (set only) bind a stream to fillColor
    var fillColor: SignalProducer<CGColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.fillColor] <~ newValue.take(duringLifetimeOf: base), for: "fillColor")
        }
    }

}
#endif
