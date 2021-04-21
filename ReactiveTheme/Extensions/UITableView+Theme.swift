//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UITableView {

    /// (set only) bind a stream to separatorColor
    var separatorColor: SignalProducer<UIColor?, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.separatorColor] <~ newValue.take(duringLifetimeOf: base), for: "separatorColor")
        }
    }

}
#endif
