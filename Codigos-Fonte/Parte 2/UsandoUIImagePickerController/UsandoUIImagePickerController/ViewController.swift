//
//  ViewController.swift
//  UsandoUIImagePickerController
//
//  Created by João Paulo Scopus on 04/12/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {

    let imagePicker = UIImagePickerController()
    var imageSelected: UIImage? = nil
    @IBOutlet weak var listImages: UICollectionView!
    
    
    var myPhotos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePhoto(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PhotoSelectedVC {
            dest.image = self.imageSelected
        }
    }
}

extension ViewController: UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imgSelected = info[UIImagePickerControllerOriginalImage]  {
            self.myPhotos.append(imgSelected as! UIImage)
            self.listImages.reloadData()
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.listImages.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath) as! PhotoCellVC
        
        cell.imgItem.image = self.myPhotos[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.imageSelected = self.myPhotos[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "toZoom", sender: nil)
    }
    
    
}




