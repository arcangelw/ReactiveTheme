//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

#if os(iOS)

import UIKit
import ReactiveSwift
import ReactiveCocoa


public extension ThemeProxy where Base: UITableViewCell {

    /// (set only) bind a stream to selectionStyle
    var selectionStyle: SignalProducer<UITableViewCell.SelectionStyle, Never> {
        get { return .empty }
        set {
            hold(base.reactive[\.selectionStyle] <~ newValue.take(duringLifetimeOf: base), for: "selectionStyle")
        }
    }

}
#endif
