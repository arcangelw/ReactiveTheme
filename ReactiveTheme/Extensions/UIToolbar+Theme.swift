//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UIToolbar {

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
            hold(base.reactive[\.barTintColor] <~ newValue.take(duringLifetimeOf: base), for: "barTintColor")
        }
    }

}
#endif
