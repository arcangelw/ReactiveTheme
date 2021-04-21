//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UINavigationBar {

    /// (set only) bind a stream to barStyle
    var barStyle: SignalProducer<UIBarStyle, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.barStyle] <~ newValue.take(duringLifetimeOf: base), for: "barStyle")
        }
    }

    /// (set only) bind a stream to barTintColor
    var barTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive.barTintColor <~ newValue.take(duringLifetimeOf: base), for: "barTintColor")
        }
    }

    /// (set only) bind a stream to titleTextAttributes
    var titleTextAttributes: SignalProducer<[NSAttributedString.Key: Any]?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.titleTextAttributes] <~ newValue.take(duringLifetimeOf: base), for: "titleTextAttributes")
        }
    }

    /// (set only) bind a stream to largeTitleTextAttributes
    @available(iOS 11.0, *)
    var largeTitleTextAttributes: SignalProducer<[NSAttributedString.Key: Any]?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.largeTitleTextAttributes] <~ newValue.take(duringLifetimeOf: base), for: "largeTitleTextAttributes")
        }
    }

}
#endif
