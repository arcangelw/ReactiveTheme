//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UIPageControl {

    /// (set only) bind a stream to pageIndicatorTintColor
    var pageIndicatorTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.pageIndicatorTintColor] <~ newValue.take(duringLifetimeOf: base), for: "pageIndicatorTintColor")
        }
    }

    /// (set only) bind a stream to currentPageIndicatorTintColor
    var currentPageIndicatorTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.currentPageIndicatorTintColor] <~ newValue.take(duringLifetimeOf: base), for: "currentPageIndicatorTintColor")
        }
    }

}
#endif
