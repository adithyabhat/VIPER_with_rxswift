//
//  Interactor.swift
//  VIPER Demo
//
//  Created by Adithya hayagreeva on 5/26/20.
//  Copyright © 2020 Emirates NBD. All rights reserved.
//

import Foundation

class Interactor {
    
    let apiModule = APIModule.shared
    
    func getImages(completionHandler: @escaping (([ImageModel]) -> Void)) {
        apiModule.fetchImages { (imagesAPIResponse) in
            guard let imagesAPIResponse = imagesAPIResponse else {
                completionHandler([])
                return
            }
            
            //Create list of ImageModel from ImagesAPIResponse
            var imageModelList = [ImageModel]()
            for imageData in imagesAPIResponse.hits {
                imageModelList.append(ImageModel(url: imageData.previewURL,
                                                 width: imageData.previewWidth,
                                                 height: imageData.previewHeight))
            }
            completionHandler(imageModelList)
        }
    }
    
}
