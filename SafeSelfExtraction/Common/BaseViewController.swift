//
//  BaseViewController.swift
//  SafeSelfExtraction
//
//  Created by Yaroslav Abaturov on 11.03.2023.
//

import UIKit

class BaseViewController<InteractorT>: UIViewController {
    override func viewDidLoad() { super.viewDidLoad() }
    
    var interactor: InteractorT?
}
