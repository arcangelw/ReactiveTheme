//
//  ThemeService.swift
//
//  Created by duan on 2019/01/22.
//  2018 Copyright (c) ReactiveSwiftCommunity. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa


public class ThemeService<Provider: ThemeProvider>: NSObject {

    init(initial: Provider) {
        self.relay = MutableProperty<Provider>(initial)
    }
    private let relay: MutableProperty<Provider>
    private var cache = [Provider: Provider.T]()
    private func getAssociatedObject(_ key: Provider) -> Provider.T {
        if let cached = cache[key] { return cached }
        let object = key.associatedObject
        cache[key] = object
        return object
    }

    /// Current theme type
    public var type: Provider { return self.relay.value }

    /// Current theme attributes
    public var attrs: Provider.T { return self.getAssociatedObject(self.type) }

    /// Theme type stream
    public var typeStream: SignalProducer<Provider, Never> {
        return relay.producer
    }

    /// Theme attributes stream
    public var attrsStream: SignalProducer<Provider.T, Never> {
        return typeStream.map { [unowned self] in self.getAssociatedObject($0) }
    }

    /// Theme attribute stream for mapper
    public func attrStream<U>(_ mapper: @escaping ((Provider.T) -> U)) -> SignalProducer<U, Never> {
        return attrsStream.map(mapper)
    }

    /// Update theme type
    public func `switch`(_ theme: Provider) {
        self.relay.value = theme
    }

    /// Bindable sink for theme switch
    public var switcher: BindingTarget<Provider> {
        return reactive.makeBindingTarget {
            $0.switch($1)
        }
    }

    /// Start chainable binding
    public var reactiveBindable: ThemeBindable<Provider.T> {
        return ThemeBindable(relay: attrsStream)
    }

}
