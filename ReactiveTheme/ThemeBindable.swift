//
//  Created by duan on 2018/3/7.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa


public class ThemeBindable<T> {
    private let relay: SignalProducer<T, Never>
    private var disposables: [Disposable?]

    init(relay: SignalProducer<T, Never>) {
        self.relay = relay
        self.disposables = []
    }

    /// Bind theme attributes to UI attributes
    ///
    /// - Parameters:
    ///   - from: attribute map
    ///   - binders: Binder sinks
    /// - Returns: ThemeBindable instance
    @discardableResult
    public func bind<U>(_ from: @escaping ((T) -> U),
                        to binders: [BindingTarget<U>]) -> ThemeBindable {
        disposables += binders.map {
            $0 <~ self.relay.map(from)
        }
        return self
    }

    /// Bind theme attributes to UI attributes
    ///
    /// - Parameters:
    ///   - from: attribute map
    ///   - binders: Binder sinks
    /// - Returns: ThemeBindable instance
    @discardableResult
    public func bind<U>(_ from: @escaping ((T) -> U), to binders: BindingTarget<U>...) -> ThemeBindable {
        return self.bind(from, to: binders)
    }

    /// Add disposables to dispose bag
    public func disposed(by disposeBag: CompositeDisposable) {
        disposeBag += CompositeDisposable(disposables)
    }
}
