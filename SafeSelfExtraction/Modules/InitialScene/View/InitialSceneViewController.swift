//
//  InitialSceneViewController.swift
//  SafeSelfExtraction
//
//  Created by Yaroslav Abaturov on 11.03.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class InitialSceneViewController: BaseViewController<InitialSceneInteractable> {
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: Constants.animationDuration / 2, delay: 0, animations: extract { sSelf in
            sSelf.someView.alpha = Constants.minAlpha
        }, completion: extract { sSelf, finished in
            sSelf.someView.backgroundColor = finished ? Constants.colours.second : Constants.colours.first
            UIView.animate(withDuration: Constants.animationDuration / 2, delay: 0, animations: sSelf.extract { sSelf in
                sSelf.someView.alpha = Constants.maxAlpha
            }, completion: sSelf.extract { sSelf, finished in
                sSelf.interactor?.makeRequest(requestType: .performCall)
            })
        })
    }
    
    private func setup() {
        self.someView.backgroundColor = Constants.colours.first
        interactor?.makeRequest(requestType: .initialSetup)
    }
    
    @IBOutlet private weak var someView: UIView!
}

extension InitialSceneViewController: InitialSceneViewControllerType {
    func update(viewModelDataType: InitialSceneViewControllerViewModel.ViewModelDataType) {
        switch viewModelDataType {
        case .initialSetup(let model):
            print("\(self) \(#function) with model instance \(model)")
        case .callReceived:
            UIView.animate(withDuration: Constants.animationDuration / 2, delay: 0, animations: extract { sSelf in
                sSelf.someView.alpha = Constants.minAlpha
            }, completion: extract { sSelf, finished in
                sSelf.someView.backgroundColor = finished ? Constants.colours.first : Constants.colours.second
                UIView.animate(withDuration: Constants.animationDuration / 2, delay: 0, animations: sSelf.extract { sSelf in
                    sSelf.someView.alpha = Constants.maxAlpha
                }, completion: sSelf.extract { _, _ in
                    print("That's it!)")
                })
            })
        }
    }
}

extension InitialSceneViewController {
    private struct Constants {
        static let minAlpha: CGFloat = 0.0
        static let maxAlpha: CGFloat = 1.0
        static let animationDuration: Double = 2
        static let colours: (first: UIColor, second: UIColor) = (first: .blue, second: .red)
    }
}
