//
//  InitialScenePresenterContract.swift
//  SafeSelfExtraction
//
//  Created by Yaroslav Abaturov on 11.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialScenePresentable: AnyObject {
	func response(responseType: InitialScenePresenterResponse.InitialSceneResponseType)
}

struct InitialScenePresenterResponse {
    enum InitialSceneResponseType {
        case initialSetup
        case callReceived
        case releaseView
    }
}
