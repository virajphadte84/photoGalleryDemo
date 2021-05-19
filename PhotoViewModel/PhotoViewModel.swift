//
//  PhotoViewModel.swift
//  photoGalleryTask
//
//  Created by AT-mac04 on 18/05/21.
//

import Foundation
import KRProgressHUD

class  PhotoViewModel{
    
    weak var vc : ViewController?
    var photoArray = [PhotoAlbum]()
    
    func getPhotoList(){
        KRProgressHUD.show()
        PhotoAPI.shared.getPhotoListAPI { (photoArray, error) in
            if (error == nil){
             
                DispatchQueue.main.async {
                    self.photoArray.append(contentsOf: photoArray!)
                    self.vc?.PhotoGalleryView.reloadData()
                    KRProgressHUD.dismiss()
                }
            }
        }
    }
    
}
