//
//  InitialSceneViewModel.swift
//  SafeSelfExtraction
//
//  Created by Yaroslav Abaturov on 11.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneViewModelType {
    func performCall(completion: @escaping (Bool) -> ())
}

class InitialSceneViewModel: InitialSceneViewModelType {
    func performCall(completion: @escaping (Bool) -> ()) {
        MainCore.shared.call { completion($0) }
    }
}
