//
//  MainCore.swift
//  SafeSelfExtraction
//
//  Created by Yaroslav Abaturov on 11.03.2023.
//

import Foundation

protocol MainCoreType {
    func call(completion: @escaping () -> ())
}

class MainCore {
    static let shared = MainCore()
    
    private init() { }
    
    func call(completion: @escaping (Bool) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            completion(true)
        }
    }
}
