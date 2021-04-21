//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UIBarButtonItem {

    /// (set only) bind a stream to tintColor
    var tintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.tintColor] <~ newValue.take(duringLifetimeOf: base), for: "tintColor")
        }
    }

}
#endif
