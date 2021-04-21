//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UISegmentedControl {

    /// (set only) bind a stream to style
    @available(iOS 13, tvOS 13, *)
    var selectedSegmentTintColor: SignalProducer<UIColor, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.selectedSegmentTintColor] <~ newValue.take(duringLifetimeOf: base), for: "selectedSegmentTintColor")
        }
    }

}
#endif
