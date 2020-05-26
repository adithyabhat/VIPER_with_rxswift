//
//  Presenter.swift
//  VIPER Demo
//
//  Created by Adithya hayagreeva on 5/26/20.
//  Copyright © 2020 Emirates NBD. All rights reserved.
//

import Foundation
import RxSwift

class Presenter {
    
    //MARK: - Properties
    
    private let interactor: Interactor
    private var images = [ImageModel]()
    
    public var contentUpdated = PublishSubject<Void>()
    public var numberOfSections: Int { return 1}
    public var numberOfRows: Int { images.count }
    
    //MARK: - init method
    
    init(interactor: Interactor) {
        self.interactor = interactor
    }
    
    //MARK: - Private helper methods
    
    private func loadImages() {
        interactor.getImages { [weak self] (imageModelList) in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.images = imageModelList
                strongSelf.contentUpdated.onNext(())
            }
        }
    }

    //MARK: - Public helper methods
    
    func initializeContentLoad() {
        loadImages()
    }
    
    func imageItem(forIndex index: Int) -> ImageModel {
        guard images.indices.contains(index) else { fatalError("Invalid index passed") }
        return images[index]
    }
}
