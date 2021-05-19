//
//  photoDetailViewController.swift
//  photoGalleryTask
//
//  Created by AT-mac04 on 18/05/21.
//

import UIKit
import Kingfisher

class photoDetailViewController: UIViewController {
    var photoOBJ : PhotoAlbum?
    @IBOutlet weak var imagePhotoView: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        photoTitle.text = photoOBJ?.photoTitle
        imagePhotoView.kf.setImage(with:URL(string: photoOBJ?.photoURL ?? "") )
    }
    


}
