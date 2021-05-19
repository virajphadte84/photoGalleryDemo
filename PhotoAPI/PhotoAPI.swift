//
//  PhotoAPI.swift
//  photoGalleryTask
//
//  Created by AT-mac04 on 17/05/21.
//

import Foundation
import Alamofire



final class PhotoAPI {
    
    static let shared = PhotoAPI()
    
    private init() {
        
    }
    
    func getPhotoListAPI(completionHandler : @escaping([PhotoAlbum]?,Error?)->()){
        var photoArray = [PhotoAlbum]()
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        let photoListRequest = AF.request(url)
        
        
        photoListRequest.response { (response) in
            
            if let data = response.data {
                do {
                    let photoResponse = try JSONDecoder().decode([PhotoAlbum].self, from: data)
                    photoArray.append(contentsOf: photoResponse)
                    print(photoResponse)
                   completionHandler(photoArray,nil)
                   
                }catch let err{
                    print(err.localizedDescription)
                    completionHandler(nil,err)
                }
            }
            
        }

        
    }
    
    
}
