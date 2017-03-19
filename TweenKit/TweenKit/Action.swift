//
//  Action.swift
//  TweenKit
//
//  Created by Steve Barnegren on 17/03/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation

// MARK: - Shedulable Action

public protocol SchedulableAction: class {
}

// MARK: - Finite Time Action

public protocol FiniteTimeAction : class {
    
    var duration: Double {get}
    var reverse: Bool {get set}
    var onBecomeActive: () -> () {get set}
    var onBecomeInactive: () -> () {get set}
    
    func willBecomeActive()
    func didBecomeInactive()
    func update(t: CFTimeInterval)
}

public extension FiniteTimeAction {
    public func willBecomeActive(){
        onBecomeActive()
    }
    
    public func didBecomeInactive(){
        onBecomeInactive()
    }
}

// MARK: - Infinite Time Action

public protocol InfiniteTimeAction : class {
    func update(elapsedTime: CFTimeInterval)
}