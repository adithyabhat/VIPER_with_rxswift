//
//  Router.swift
//  VIPER Demo
//
//  Created by Adithya hayagreeva on 5/26/20.
//  Copyright © 2020 Emirates NBD. All rights reserved.
//

import Foundation

class Router {
    
    func initialViewController() -> TableViewController {
        let interactor = Interactor()
        let presenter = Presenter(interactor: interactor)
        let tableViewController = TableViewController.instance(withPresenter: presenter)
        return tableViewController
    }
    
}
