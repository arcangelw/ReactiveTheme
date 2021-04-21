//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UISlider {

    /// (set only) bind a stream to thumbTintColor
    var thumbTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.thumbTintColor] <~ newValue.take(duringLifetimeOf: base), for: "thumbTintColor")
        }
    }

    /// (set only) bind a stream to minimumTrackTintColor
    var minimumTrackTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.minimumTrackTintColor] <~ newValue.take(duringLifetimeOf: base), for: "minimumTrackTintColor")
        }
    }

    /// (set only) bind a stream to maximumTrackTintColor
    var maximumTrackTintColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.maximumTrackTintColor] <~ newValue.take(duringLifetimeOf: base), for: "maximumTrackTintColor")
        }
    }

}
#endif
