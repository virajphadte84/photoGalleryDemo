//
//  ViewController.swift
//  photoGalleryTask
//
//  Created by AT-mac04 on 17/05/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    var photoArray = [PhotoAlbum]()
    var photoViewModel = PhotoViewModel()
    @IBOutlet weak var PhotoGalleryView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        photoViewModel.vc = self 
        photoViewModel.getPhotoList()
        PhotoGalleryView.collectionViewLayout = UICollectionViewFlowLayout()
        // Do any additional setup after loading the view.
   
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotoDetails" {
            let vc = segue.destination as! photoDetailViewController
            vc.photoOBJ = sender as! PhotoAlbum
        }
    }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoViewModel.photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "photoGalleryCell", for: indexPath) as! photoGalleryCollectionViewCell
        let photoObject = photoViewModel.photoArray[indexPath.row]
        photoCell.photoTitle.text =  photoObject.photoTitle
        photoCell.photoImageView.kf.setImage(with: URL(string: photoObject.thunbnailURL ?? ""))
        
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoObject = photoViewModel.photoArray[indexPath.row]
        performSegue(withIdentifier: "showPhotoDetails", sender: photoObject)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 10)/2
        return CGSize(width: size, height: size)
    }

}
