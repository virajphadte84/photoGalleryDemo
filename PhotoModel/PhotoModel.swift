//
//  PhotoModel.swift
//  photoGalleryTask
//
//  Created by AT-mac04 on 17/05/21.
//

import Foundation


struct PhotoAlbum : Codable {
    var albumId : Int?
    var photoId : Int?
    var photoTitle : String?
    var thunbnailURL : String?
    var photoURL : String?
    
    
    enum CodingKeys : String , CodingKey {
        
        case albumId = "albumId"
        case photoId = "id"
        case photoTitle = "title"
        case thunbnailURL = "thumbnailUrl"
        case photoURL = "url"
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        albumId = try values.decode(Int.self, forKey: .albumId)
        photoId = try values.decode(Int.self, forKey: .photoId)
        photoTitle = try values.decode(String.self, forKey: .photoTitle)
        thunbnailURL = try values.decode(String.self, forKey: .thunbnailURL)
        photoURL = try values.decode(String.self, forKey: .photoURL)
        
    }
    

    
}
