//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UISwitch {

    /// (set only) bind a stream to onTintColor
    var onTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.onTintColor] <~ newValue.take(duringLifetimeOf: base), for: "onTintColor")
        }
    }

    /// (set only) bind a stream to thumbTintColor
    var thumbTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.thumbTintColor] <~ newValue.take(duringLifetimeOf: base), for: "thumbTintColor")
        }
    }

}
#endif
