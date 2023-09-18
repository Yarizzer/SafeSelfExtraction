//
//  InitialSceneInteractorContract.swift
//  SafeSelfExtraction
//
//  Created by Yaroslav Abaturov on 11.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialSceneInteractable: AnyObject {
    func makeRequest(requestType: InitialSceneInteractorRequest.RequestType)
}

struct InitialSceneInteractorRequest {
    enum RequestType {
        case initialSetup
        case performCall
    }
}
