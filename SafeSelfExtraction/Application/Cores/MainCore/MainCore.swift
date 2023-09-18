//
//  MainCore.swift
//  SafeSelfExtraction
//
//  Created by Yaroslav Abaturov on 11.03.2023.
//

import Foundation

protocol MainCoreType: AnyObject {
    func call(completion: @escaping () -> ())
}

class MainCore {
    static let shared = MainCore()
    
    private init() { }
    
    func call(completion: @escaping (Bool) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.secondsToAdd) {
            completion(true)
        }
    }
}

extension MainCore {
    private struct Constants {
        static let secondsToAdd: TimeInterval = 10
    }
}
