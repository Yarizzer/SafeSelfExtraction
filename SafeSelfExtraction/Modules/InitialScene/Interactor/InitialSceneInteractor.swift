//
//  InitialSceneInteractor.swift
//  SafeSelfExtraction
//
//  Created by Yaroslav Abaturov on 11.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import Foundation

class InitialSceneInteractor: NSObject {
	init(withRouter router: InitialSceneRoutable, presenter: InitialScenePresentable, service: InitialSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private let router: InitialSceneRoutable
	private let presenter: InitialScenePresentable
	private let service: InitialSceneInteractorServiceType
}

extension InitialSceneInteractor: InitialSceneInteractable {
	func makeRequest(requestType: InitialSceneInteractorRequest.RequestType) {
        switch requestType {
        case .initialSetup: presenter.response(responseType: .initialSetup)
        case .performCall:
            service.performCall(completion: extract { sSelf, success in
                sSelf.presenter.response(responseType: .callReceived)
            })
        }
	}
}
