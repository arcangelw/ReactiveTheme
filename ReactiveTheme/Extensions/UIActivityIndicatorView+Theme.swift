//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UIActivityIndicatorView {

    /// (set only) bind a stream to style
    var style: SignalProducer<UIActivityIndicatorView.Style, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.style] <~ newValue.take(duringLifetimeOf: base), for: "style")
        }
    }

}
#endif
