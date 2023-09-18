//
//  InitialSceneInteractorService.swift
//  SafeSelfExtraction
//
//  Created by Yaroslav Abaturov on 11.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneInteractorServiceType: AnyObject {
    func performCall(completion: @escaping (Bool) -> ())
}

class InitialSceneInteractorService {
    init(withModel model: InitialSceneViewModelType) {
        self.model = model
    }
    
    private let model: InitialSceneViewModelType
}

extension InitialSceneInteractorService: InitialSceneInteractorServiceType {
    func performCall(completion: @escaping (Bool) -> ()) {
        model.performCall { completion($0) }
    }
}
